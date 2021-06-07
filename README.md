# Salt-Stack-Learning
----

## Configure Salt Master


- **Setup Salt repository and update local repo**

	```
	wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
	echo 'deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main' | sudo tee /etc/apt/sources.list.d/saltstack.list
	sudo apt-get update
	```

- **Salt Master installation, cloud and doc**

	```
	sudo apt-get install salt-master salt-cloud salt-doc
	```

- **Creating Folder Structure**

	```
	mkdir -p {keys,pillar,reactor,salt,cloud}
	mkdir -p salt/{ssh/files,users/files,common,mysql,nginx,php7,supervisor}
	mkdir -p cloud/{cloud.providers.d,cloud.profiles.d}
	touch keys/.keep reactor/.keep
	```

- **Update Master Configuration**
search for `interface` and update it, search for `file_roots` and update as below
    ```
    sudo vi /etc/salt/master
    ........
    interface: <IP of you Master Server>
    -------
    file_root:
        base:
            - /srv/salt
    ```
    
- **Run `salt_synch.sh`, This will automate further installation and restart the salt-master service.**
    ```
    sh salt_synch.sh
    ```
    
- **Use basic command to see key**
    `sudo salt-key -L`
    Output can be as shown below
    ```
    Accepted Keys:
    Denied Keys:
    Unaccepted Keys:
    Rejected Keys
    ```

## Configure Salt Minions

- **Setup Salt repository and update local repo**

	```
	wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
	echo 'deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main' | sudo tee /etc/apt/sources.list.d/saltstack.list
	sudo apt-get update
	```

- **Salt Minion installation**

	```
	sudo apt-get install salt-minion
	```

- **Update Minion Configuration**
search for `master:salt` and update the salt with ip of you salt-master.
    ```
    sudo vi /etc/salt/minion
    -------
    master: <IP of your salt-master>
    id: minion-01
    -------
    ```

- **Restart the salt-minion**
    `sudo /etc/init.d/salt-minion restart`