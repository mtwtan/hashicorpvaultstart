# Automating the Vault Unsealing Process
## Assumptions
- Assume that this Vault setup is Docker based and managed by docker-compose.
- An example of a docker-compose setup is here: [Github link](https://github.com/mtwtan/hashicorpvault)
- Keys are encrypted using basic openssl. Vault.sh here has a basic script to encrypt and decrypt the keys.
- Keys are decrypted when required.
- Assumption is that Vault is running on localhost (127.0.0.1) and on port 8200. Change as required
## Running the script
```
$ start_vault.sh
```
