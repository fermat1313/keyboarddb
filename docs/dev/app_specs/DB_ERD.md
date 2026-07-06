/*
****************************************************
*               KeyboardDB Application             *
*                                                  *
*                    Database ERD                  *
*                                                  *
*                    Version: 0.1                  *
*                                                  *
*            Created by: Steve Peterson            *
*                  Copyright (2026)                *
*                    MIT License                   *
****************************************************
*/


                                          +----------------------+
                                          |      item_types      |
                                          +----------------------+
                                          | PK item_type_uid     |
                                          | description          |
                                          +----------+-----------+
                                                     |
                                                     | 1
                                                     |
                                                     | *
+----------------------+                             |
|     manufacturer     |                             |
+----------------------+                             |
| PK manufacturer_uid  |                             |
+----------+-----------+                             |
           |                                         |
           |1                                        |
           |                                         |
           |*                                        |
           |                                         |
+----------v-----------------------------------------v----------------------+
|                             item_master                                   |
+---------------------------------------------------------------------------+
| PK item_uid                                                               |
| FK item_type_uid                                                          |
| FK manufacturer_uid                                                       |
| FK vendor_uid                                                             |
| FK item_status_uid                                                        |
| item_name                                                                 |
| purchase_date                                                             |
| price                                                                     |
| notes                                                                     |
+------+--------------------+----------------+----------------+--------------+
       |                    |                |                |
       |                    |                |                |
       |                    |                |                |
       |                    |                |                | 
       |                    |                |                |
       |                    |                |                |
       |                    |                |                |
       v                    v                v                v

+--------------+   +----------------+   +--------------+   +---------------+
|   vendors    |   |  item_status   |   |    photos    |   |    builds     |
+--------------+   +----------------+   +--------------+   +---------------+
| PK vendor_uid|   | PK status_uid  |   | PK photo_uid |   | PK build_uid  |
+--------------+   +----------------+   | FK item_uid  |   | keyboard_uid  |
                                         | FK ext_uid   |   | keycap_uid    |
                                         +------+-------+   | switch_uid    |
                                                |           +-------+-------+
                                                |                   |
                                         +------v------+            |
                                         |photo_exts   |            |
                                         +-------------+            |
                                                                     |
                                                                     |
                                                                     |
                                                                     v
                                                                item_master