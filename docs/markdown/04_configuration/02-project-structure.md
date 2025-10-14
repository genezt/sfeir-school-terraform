
# Configuration de l’environnement de développement

## Gestion des fichiers et bonnes pratiques

Il n’y a pas de normes imposées par l’outil, mais un ensemble de bonnes pratiques :

* Tous les fichiers `*.tf` sont automatiquement analysés lors de l'exécution de terraform
* ⚠️ Doublon dans les noms.
* Chaque “feature” peut faire l’objet d’un nouveau fichier `.tf`.
* Les tests sont regroupés dans un dossier `tests`.

```text
.
├── locals.tf
├── main.tf
├── network.tf
├── outputs.tf
├── providers.tf
├── README.md
├── storage.tf
├── tests
│   ├── setup
│   |   └── main.tf
│   └── network.tftest.hcl
└── variables.tf
```

##==##

# Configuration de l’environnement de développement

## Considérations sur les variables (1/2)

* Il est conseillé de dissocier les variables et outputs du code.
* Il est important d’utiliser l’attribut description des variables.
* Les variables optionnelles prennent une valeur par défaut.
* Valider le format des variables.

```text
.
├── locals.tf
├── outputs.tf
└── variables.tf
```

##==##

# Configuration de l’environnement de développement

## Considérations sur les variables (2/2)

* Valider le format des variables.

```terraform
variable "environment" {
  type        = string
  description = "The environment, used as a prefix for resources."

  validation {
    condition     = "dev" || "stg" || "prod"
    error_message = "The environment must be one of \"dev\", \"stg\" or \"prod\"."
  }
}
```

##==##

<!-- .slide: class="with-code-bg-dark"-->

# Configuration de l’environnement de développement

## Gestion des fichiers et bonnes pratiques

* `#` pour les commentaires.
* La communauté utilise le snake_case.
* L’utilisation d’un [.editorconfig](https://editorconfig.org/) permet aux développeurs d’utiliser un même format.
* Pour aller plus loin : [Style guide Hashicorp](https://developer.hashicorp.com/terraform/language/style).

```editorconfig
[*]
indent_style = space
indent_size = 2
trim_trailing_whitespace = true

[*.{tf,tfvars}]
indent_style = space
indent_size = 2

[Makefile]
indent_style = tab
```

Notes:

Expliquer .editorconfig l'utilité entre les devs, les teams etc

##==##

<!-- .slide: class="with-code-bg-dark"-->

# Configuration de l’environnement de développement

## Ignore

* `terraform.tfstate`.
* `.terraform.tfstate.lock.info`.
* Le répertoire `.terraform`.
* Les secrets !


## Commit

* `*.tf`
* `.terraform.lock.hcl`
* `.gitignore`
* `README.md`


##==##

# Configuration de l’environnement de développement

## Configuration locale (CLI Configuration File)

Il est possible de configurer certains comportements de Terraform de manière globale à l'aide d'un fichier *.terraformrc* ou *terraform.rc*.

Fichier de config à un [emplacement spécifique](https://www.terraform.io/docs/cli/config/config-file.html) à l'OS ou via la variable d'environnement `TF_CLI_CONFIG_FILE`.

Cela permet par exemple de :

* Mettre en cache les providers pour ne pas les télécharger dans chaque workspace.
* Configurer ses identifiants pour les registres de modules privés.
* Surcharger des providers avec une version locale.
