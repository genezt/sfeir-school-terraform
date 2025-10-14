# terraform graph

Example of terraform graph

## launch
```
terraform init
terraform graph
```

## Dependency Graph Explanation

This table breaks down the components of the DOT graph output to explain the resource dependencies and Terraform's planned execution order.

| Line in DOT Output | Description | Meaning in the Execution Plan |
| :--- | :--- | :--- |
| `digraph G {` | Graph Definition Start | Defines the beginning of the directed graph structure. |
| `rankdir = "RL";` | Layout Direction | Sets the visual flow of the graph from **Right to Left**. |
| `node [shape = rect, fontname = "sans-serif"];` | Node Styling | Defines that all resources will be represented as simple rectangles. |
| `"google_compute_network.vpc_network"` | Resource Node (VPC) | Represents the Google Cloud VPC Network. |
| `"google_compute_subnetwork.example_subnet"` | Resource Node (Subnet) | Represents the Google Cloud Subnetwork. |
| **`"google_compute_subnetwork.example_subnet" -> "google_compute_network.vpc_network";`** | **The Dependency Arrow** | This is the crucial link. It dictates that the **Subnet (Source)** must wait for the **VPC Network (Target)** to be created first. |
| `}` | Graph Definition End | Closes the graph definition. |

##  Generate a picture of the graph
```
terraform graph -draw-cycles | dot -Tpng > graph.png
```

## customize the graph

### Step 1: Export the Terraform Graph to a DOT file

First, you run the terraform graph command and pipe the output into a file with a .dot extension. The DOT format is the standard graph description language used by Graphviz.
```
terraform graph > infrastructure.dot
```

### Step 2: Edit the DOT File to Change Node Shapes
You will now open the infrastructure.dot file and edit the Graphviz attributes.

The original file likely contains a line defining the default node style:

```
node [shape = ellipse, fontname = "sans-serif"];
```

### Step 3: generate the image with dot

```
dot -Tpng infrastructure.dot -o infrastructure.png
```
