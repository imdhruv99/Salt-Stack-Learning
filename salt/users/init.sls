users_pcd_user:
  user.present:
    - name: pcd
    - home: /home/pcd
    - shell: /bin/bash
    - groups:
      - sudo
      - adm
      