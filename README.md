# CS152B Projects

## Setting up git remote with SSH
Adapted from [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).
 1. run `ssh-keygen -t rsa -b 4096 -C "your_email@example.com"` and just press enter until the keys are created.
 2. run `eval "$(ssh-agent -s)"`
 3. create a file `~/.ssh/config` and add the following lines
    ```
    Host *
      IdentityFile ~/.ssh/id_rsa
    ```
    change the file permissions by running:
    ```shell
    chown $USER ~/.ssh/config
    chmod 644 ~/.ssh/config
    ```
 4. run `ssh-add ~/.ssh/id_rsa`
 5. follow the steps [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) to copy your newly created public key into GitHub.
