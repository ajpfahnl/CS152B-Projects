# CS152B Projects

## Introductory Projects

Labs 1 to 3 are introductory projects intended to familiarize ourselves with Verilog, HDL design, higher level abstractions with the Microblaze soft processor, and serial communication. Open their respective folders to see the projects involved. These projects utilized the Xilinx ISE on a Digilent Genesys board.

## Snake final project

Our final project utilizes a Basys3 board programmed with Vivado and Vitus. The project is documented [here](./snake.md).

## Notes for setting up the projects locally
### Setting up git remote with SSH
These steps were needed for some of us to use git on the Oracle Linux VirtualBox environment for the Xilinx ISE. Also make sure to sync the clock to the correct time.

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
