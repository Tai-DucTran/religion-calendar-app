# Religion Calendar Mobile App

The religion mobile app.

## Getting Started

1. Follow the instructions in [Flutter Version Management](#Flutter-Version-Management)
2. Install [Melos](#Melos) as a global package via pub.dev so it can be used from anywhere on your system. `dart pub global activate melos`
3. Bootstrap the repository with `melos bs`
4. Generate the necessary files with `melos run generate` or check out [makefile]

## Flutter Version Management

We are using [fvm](https://fvm.app/docs/getting_started/overview) and flutter version is set in .fvmrc

1. [install fvm](https://fvm.app/docs/getting_started/installation)
2. in project root folder, run `fvm use`
3. setup IDE configuration https://fvm.app/docs/getting_started/configuration#ide

## Melos

Melos is a CLI tool used to help manage Dart projects with multiple packages.

All Melos scripts can be run using `melos run {script name}`

1. `Generate`: Build all generated files for Dart & Flutter packages in this project.
2. `Test`: Runs all test for Dart & Flutter packages in this project.
3. Common CLI commands: https://melos.invertase.dev/commands/analyze

Melos also comes with IDE support for `VSCode` and `IntelliJ` to make running scripts easy.
[IDE Support](https://melos.invertase.dev/ide-support)

### makefile:

1. `make bs`: Helps to clean and re-initialize the workspace, links local packages together and installs remaining package dependencies.
2. `make gen`: clean, re-initialize & generate all necessary files
3. `make l10n`: after adding any new localization in [app_en.arb] and [app_vi.arb], it helps to re-generate [localized_keys.dart]
4. `make upgrade`: recommend running this command after upgrading new flutter version.
5. `make rm-gen`: remove all generated files
6. `make native_splash`: generate initial splash screen.

## Directory Structure

| Path                      | Description                  |
| ------------------------- | ---------------------------- |
| lib/const                 | App-level constants          |
| lib/l10n                  | Localizations                |
| lib/src/modules           | Directories for each feature |
| lib/src/router            | App routes                   |
| lib/src/utils             | App-level utilities          |
| lib/src/widgets           | App-level resusable widgets  |
| lib/firebase_options.dart | firebase                     |
| lib/main.dart             | Root widget for the app      |
| packages/aries            | Design system                |

### Modules

Generally, each module represents a feature in the app. This organization by feature helps us achieve high cohesion and low coupling in our codebase.

This is the suggested directory structure for each module:

| Path          | Description                                |
| ------------- | ------------------------------------------ |
| const/        | Module-level constants                     |
| models/       | Data models                                |
| providers/    | Providers to manage state                  |
| repositories/ | Repository layer to interface with the API |
| utils/        | Module-level utilities                     |
| widgets/      | Module-level components                    |

### Widgets

#### Module-level widgets (`my_module/widgets`)

Module-level widgets are not organized the same way as app-level widgets to reduce unnecessary directory nesting. It follows [ATOMICS Design Methodology](https://medium.com/@maag070208/atomic-design-15c502fd128e)

This is an example directory structure for each module's wigets directory:

```
my_module/widgets/
  atoms/
  molecules/
  organism/
  page/
```

### Localization

This project stores localized-key translate in the project for no-internet uses.

#### How to add a new localization?

1. Add new value into all `.arb` files (do not forgot any file)

- If some keys don't have localization, we return English version as default

2. After add, run `make l10n` to re-generate `localized_keys.dart`
3. In the Text widget, return the localization like this:
   `Text(
  LocalizedKeys.eventRemindMeBefore,
),`

#### Name convention

- Always add the `Text` element after any keys like `atTimeOfEventText` or `calendarCategorySolarText`
- If the key is used for a button, always add the `Button` before `Text` such as `submitHereButtonText`, `viewAllButtonText`.

#### Directory and File Naming Conventions

- Directories and files are named in `snake_case`

## JSON serialization

This project uses json_serializable to [auto-generate](https://flutter.dev/docs/development/data-and-backend/json#serializing-json-using-code-generation-libraries) `.fromJson` and `.toJson`.
After specifying the model, run `fvm flutter pub run build_runner build --delete-conflicting-outputs`.

## Aries

| Path                           | Description              |
| ------------------------------ | ------------------------ |
| packages/aries/assets/images/  | Aries assets level       |
| packages/aries/src/colors      | Aries colors system      |
| packages/aries/src/icons       | Aries icons system       |
| packages/aries/src/images      | Aries images system      |
| packages/aries/src/spacing     | Aries spacing system     |
| packages/aries/src/text_styles | Aries text_styles system |

How to add an asset to Aries such images, icons:

1. add the .svg icon/images in correct path
2. run `melos bs` in project's root and aries level
3. restart the app

## Add TODO comments

- Add your name in after the TODO
- Always create a new jira card task and add it below the comment

Example:
<<<<<<< HEAD
`/// TODO (Tai): Handle verify flow
        /// https://taisidehustle.atlassian.net/browse/KAN-11`
=======
`/// TODO (Tai): Handle verify flow
        /// https://taisidehustle.atlassian.net/browse/KAN-11`

> > > > > > > 2f83ac7 (Housekeeping: added more lines)

## Name the branch

To name the branch follows these convention

- To implement a new feature: `feature/jira-task`
- To fix a bug: `fix/jira-task`
- To update flutter version `upgrade/jira-task`

## Commit message

- To commit changes related to a module: `Module-Name: commit message`
- To update or changes something nits: `Housekeeping: commit message`

- This is the first conflict line.
- This is the 2nd conflict line.
- This is the 3rd conflict line.
- This is the 4th conflict line.
- This is the 5th conflict line.
- This is the last conflict line.
