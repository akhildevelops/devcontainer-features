To fix file permission errors, add 
[something like this](https://github.com/google/android-fhir/blob/603792f4e865ba3c736565d40672eda3a587ad97/.devcontainer/devcontainer.json#L29)
to your `devcontainer.json`:

```json
"postCreateCommand": "sudo chown -R vscode:vscode /opt/android/"
```
