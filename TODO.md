# TODO file for a new activity package

- Read all the `INTRODUCTION.md` files and follow their guidance (the files
  should help you get an understanding of what belongs where in this new
  activity package).
- Add your content to the top-level `README.md` file.
- Add your license text to the `LICENSE` file.
- Make your changes to this project and make it yours.
- Refer to the "Full workflow with CLI" below for running your activity.

# Full workflow with CLI

In the shell (or the command prompt), do the following:

## Creating a new activity

```bash
robo init new_activity
cd new_activity
```

## Creating an executable activity package

```bash
robo wrap
```

## Running the activity

Windows:

```
robo run entrypoint.cmd
```

macOS / Linux:

```bash
robo run entrypoint.sh
```

## Providing access credentials for Robocloud connectivity

```bash
robo credentials <paste your credentials here>
```

## Uploading to Robocloud

```bash
robo upload --workspace 111 --activity 111
```
