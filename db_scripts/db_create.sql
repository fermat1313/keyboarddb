/*
****************************************************
*               KeyboardDB Application             *
*                                                  *
*              Database creation scrip             *
*                                                  *
*                    Version: 0.1                  *
*                                                  *
*            Created by: Steve Peterson            *
*                  Copyright (2026)                *
*                    MIT License                   *
****************************************************
*/

-- Set database version number
DECLARE { @LOCAL_VARIABLE text = 0.1 };DECLARE { @LOCAL_VARIABLE data_type [ = value ] }


/*      Create Database and set up schema for keyboardDB      */
CREATE TABLE item_master (
    item_uid BLOB PRIMARY KEY,
    item_type_uid BLOB NOT NULL,
    item_name TEXT NOT NULL,
    manufacturer_uid BLOB NOT NULL,
    vendor_uid BLOB NOT NULL,
    item_purchase_date DATE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    item_seller_name TEXT,
    item_price DECIMAL(10,2) NOT NULL,
    item_status_uid BLOB NOT NULL,
    item_version TEXT NOT NULL,
    item_notes TEXT NOT NULL
    item_deleted BOOLEAN DEFAULT FALSE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
    FOREIGN KEY (item_type_uid) REFERENCES item_types(item_type_uid),
    FOREIGN KEY (manufacturer_uid) REFERENCES manufacturer(manufacturer_uid),
    FOREIGN KEY (vendor_uid) REFERENCES vendors(vendor_uid),
    FOREIGN KEY (item_status_uid) REFERENCES item_status(item_status_uid)
);

create table keyboard_master (
    keyboard_master_uid BLOB PRIMARY KEY,
    item_uid BLOB NOT NULL,
    keyboard_material_uid BLOB NOT NULL,
    keyboard_layout_uid BLOB NOT NULL,
    keyboard_layouts_wk_uid BLOB NOT NULL,
    keyboard_macro_columns INTEGER NOT NULL,
    item_deleted BOOLEAN DEFAULT FALSE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (item_uid) REFERENCES item_master(item_uid),
    FOREIGN KEY (keyboard_material_uid) REFERENCES materials(material_uid),
    FOREIGN KEY (keyboard_layout_uid) REFERENCES keyboard_layouts(keyboard_layout_uid),
    FOREIGN KEY (keyboard_layouts_wk_uid) REFERENCES keyboard_layouts_wk(keyboard_layout_wk_uid)
);

create table keyboard_material_links (
    keyboard_material_link_uid BLOB PRIMARY KEY,
    keyboard_master_uid BLOB NOT NULL,
    material_uid BLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
    FOREIGN KEY (keyboard_master_uid) REFERENCES keyboard_master(keyboard_master_uid)
    FOREIGN KEY (material_uid) REFERENCES materials(material_uid)
);

create table keyboard_finish_types (
    keyboard_finish_type_uid BLOB PRIMARY KEY,
    keyboard_finish_type_desc TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table keyboard_finish_links (
    keyboard_finish_link_uid BLOB PRIMARY KEY,
    keyboard_master_uid BLOB NOT NULL,
    keyboard_finish_type_uid BLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
    FOREIGN KEY (keyboard_master_uid) REFERENCES keyboard_master(keyboard_master_uid)
    FOREIGN KEY (keyboard_finish_type_uid) REFERENCES keyboard_finish_types(keyboard_finish_type_uid)
);

create table keyboard_layouts (
    keyboard_layout_uid BLOB PRIMARY KEY,
    keyboard_layout_desc TEXT NOT NULL,
    keyboard_layout_size INTEGER NOT NULL,   
    keyboard_layout_macro_columns INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table keyboard_layouts_wk (    
    keyboard_layout_wk_uid BLOB PRIMARY KEY,
    keyboard_layout_wk_desc TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table keyboard_finish_types (
    keyboard_finish_type_uid BLOB PRIMARY KEY,
    keyboard_finish_type_desc TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table keycaps_master (
    keycap_uid BLOB PRIMARY KEY,
    keycap_material_uid BLOB NOT NULL,
    keycap_profile_uid BLOB NOT NULL,
    keycap_manufacture_method_uid BLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (keycap_material_uid) REFERENCES materials(material_uid),
    FOREIGN KEY (keycap_profile_uid) REFERENCES keycap_profiles(keycap_profile_uid),
    FOREIGN KEY (keycap_manufacture_method_uid) REFERENCES keycap_manufacture_methods(keycap_manufacture_method_uid),
);


create table keycap_profiles (
    keycap_profile_uid BLOB PRIMARY KEY,
    keycap_profile_desc TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table keycap_manufacture_methods (
    keycap_manufacture_method_uid BLOB PRIMARY KEY,
    keycap_manufacture_method_desc TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table swithches_master (
    switch_uid BLOB PRIMARY KEY,
    switch_manufacturer_uid BLOB NOT NULL,
    switch_type TEXT NOT NULL,
    switch_activation_force INTEGER NOT NULL,
    switch_bottom_out_force INTEGER NOT NULL,
    switch_travel_distance INTEGER NOT NULL,
    switch_actuation_poINTEGER INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
    FOREIGN KEY (switch_manufacturer_uid) REFERENCES manufacturer(manufacturer_uid)
);

create table switch_types (
    switch_type_uid BLOB PRIMARY KEY,
    switch_type_desc TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table manufacturer (
    manufacturer_uid BLOB PRIMARY KEY,
    manufacturer_name TEXT NOT NULL,
    manufacturer_website TEXT,
    manufacturer_phone TEXT,
    manufacturer_email TEXT,
    manufacturer_discord TEXT,
    manufacturer_notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table vendors (
    vendor_uid BLOB PRIMARY KEY,
    vendor_name TEXT NOT NULL NOT NULL,
    vendor_website TEXT NOT NULL,
    vendor_phone TEXT NOT NULL,
    vendor_email TEXT NOT NULL,
    vendor_discord TEXT NOT NULL,
    vendor_notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table item_status (
    item_status_uid BLOB PRIMARY KEY,
    item_status_description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table item_types (
    item_type_uid BLOB PRIMARY KEY,
    item_type_description TEXT NOT NULL,
    item_type_table TEXT NOT NULL,
    item_type_bitmap_value INTEGER NOT NULL,
    item_type_links_to_keyboard BOOLEAN DEFAULT FALSE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table pcb_types (
    pcb_type_uid BLOB PRIMARY KEY,
    pcb_type_desc TEXT NOT NULL,
    pcb_is_hotswappable BOOLEAN DEFAULT TRUE NOT NULL, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table pcb_keyboard_links (
    pcb_keyboard_link_uid BLOB PRIMARY KEY,
    pcb_type_uid BLOB NOT NULL,
    keyboard_master_uid BLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
    FOREIGN KEY (pcb_type_uid) REFERENCES pcb_types(pcb_type_uid),
    FOREIGN KEY (keyboard_master_uid) REFERENCES keyboard_master(keyboard_master_uid)
);

create table plate_types (
    plate_type_uid BLOB PRIMARY KEY,
    plate_type_desc TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table plate_keyboard_links (
    plate_keyboard_link_uid BLOB PRIMARY KEY,
    plate_type_uid BLOB NOT NULL,
    keyboard_master_uid BLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
    FOREIGN KEY (plate_type_uid) REFERENCES plate_types(plate_type_uid),
    FOREIGN KEY (keyboard_master_uid) REFERENCES keyboard_master(keyboard_master_uid)
);


create table colors (
    color_uid BLOB PRIMARY KEY,
    color_desc TEXT NOT NULL,
    color_hex TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table keycap_profiles (
    keycap_profile_uid BLOB PRIMARY KEY,
    keycap_profile_desc TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table keycap_manufacture_methods (
    keycap_manufacture_method_uid BLOB PRIMARY KEY,
    keycap_manufacture_method_desc TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table artisan_master (
    artisan_uid BLOB PRIMARY KEY,
    artisan_material_uid BLOB NOT NULL,
    keycap_profile_uid BLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
    FOREIGN KEY (artisan_material_uid) REFERENCES materials(material_uid),
    FOREIGN KEY (keycap_profile_uid) REFERENCES keycap_profiles(keycap_profile_uid)
);

create table item_tags (
    item_tag_uid BLOB PRIMARY KEY,
    item_tag_desc TEXT NOT NULL,
    item_tag_applies_to INTEGER DEFAULT 0 NOT NULL,
    item_tag_type text,
    item_tag_data text,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table item_tag_links (
    item_tag_link_uid BLOB PRIMARY KEY,
    item_tag_uid BLOB NOT NULL,
    item_uid BLOB NOT NULL,
    item_tag_link_type int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
    FOREIGN KEY (item_tag_uid) REFERENCES item_tags(item_tag_uid),
    FOREIGN KEY (item_uid) REFERENCES item_master(item_uid)
);

create table color_tag_links (
    item_color_tag_link_uid BLOB PRIMARY KEY,
    item_uid BLOB NOT NULL,
    color_uid BLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
    FOREIGN KEY (item_uid) REFERENCES item_master(item_uid),
    FOREIGN KEY (color_uid) REFERENCES colors(color_uid)
);

create table material_tag_links (
    item_material_tag_link_uid BLOB PRIMARY KEY,
    item_material_link_uid BLOB NOT NULL,
    item_uid BLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
    FOREIGN KEY (item_material_link_uid) REFERENCES materials(material_uid),
    FOREIGN KEY (item_uid) REFERENCES item_master(item_uid)
);

create table photos (
    photo_uid BLOB PRIMARY KEY,
    item_uid BLOB NOT NULL,
    photo_extention_uid BLOB NOT NULL,
    photo_data BLOB NOT NULL,
    photo_description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
    FOREIGN KEY (item_uid) REFERENCES item_master(item_uid),
    FOREIGN KEY (photo_extention_uid) REFERENCES photo_extentions(photo_extention_uid)
);

create table photo_item_links (
    photo_item_link_uid BLOB PRIMARY KEY,
    photo_uid BLOB NOT NULL,
    item_uid BLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
    FOREIGN KEY (photo_uid) REFERENCES photos(photo_uid),
    FOREIGN KEY (item_uid) REFERENCES item_master(item_uid)
);

create table photo_extentions (
    photo_extention_uid BLOB PRIMARY KEY,
    photo_extention_desc TEXT NOT NULL,
    photo_mime_type TEXT NOT NULL,
    photo_extention_displayable BOOLEAN DEFAULT TRUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table builds (
    build_uid BLOB PRIMARY KEY,
    build_name TEXT NOT NULL,
    build_keyboard_master_uid BLOB NOT NULL,
    build_keycap_uid BLOB NOT NULL,
    build_switch_uid BLOB NOT NULL,
    build_pcb_type_uid BLOB NOT NULL,
    build_plate_type_uid BLOB NOT NULL,
    build_currently_built BOOLEAN DEFAULT TRUE NOT NULL,
    build_notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
    FOREIGN KEY (build_keyboard_master_uid) REFERENCES keyboard_master(keyboard_master_uid),
    FOREIGN KEY (build_keycap_uid) REFERENCES keycaps_master(keycap_uid),
    FOREIGN KEY (build_switch_uid) REFERENCES swithches_master(switch_uid),
    FOREIGN KEY (build_pcb_type_uid) REFERENCES pcb_types(pcb_type_uid),
    FOREIGN KEY (build_plate_type_uid) REFERENCES plate_types(plate_type_uid)
);

create table build_photo_links (
    build_photo_link_uid BLOB PRIMARY KEY,
    build_uid BLOB NOT NULL,
    photo_uid BLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
    FOREIGN KEY (build_uid) REFERENCES builds(build_uid),
    FOREIGN KEY (photo_uid) REFERENCES photos(photo_uid)
);

create table db_version (
    db_version_uid BLOB PRIMARY KEY,
    db_version_number TEXT NOT NULL,
    db_version_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table materials (
    material_uid BLOB PRIMARY KEY,
    material_desc TEXT NOT NULL,
    material_applies_to ING NOT NULL,  -BITMAP see Entity_types for values
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL

);

create table entity_types (
    entity_type_uid BLOB PRIMARY KEY,
    entity_type_desc TEXT NOT NULL,
    entity_type_table TEXT NOT NULL,
    entity_type_bitmap_value INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);


/*          Create Indexes          */

-- item_master: primary search/filter target (search box + multi-field filters)
CREATE INDEX idx_item_master_type ON item_master(item_type_uid) WHERE deleted = FALSE;
CREATE INDEX idx_item_master_manufacturer ON item_master(manufacturer_uid) WHERE deleted = FALSE;
CREATE INDEX idx_item_master_vendor ON item_master(item_vendor_uid) WHERE deleted = FALSE;
CREATE INDEX idx_item_master_status ON item_master(item_status_uid) WHERE deleted = FALSE;
CREATE INDEX idx_item_master_purchase_date ON item_master(item_purchase_date) WHERE deleted = FALSE;
CREATE INDEX idx_item_master_price ON item_master(item_price) WHERE deleted = FALSE;
CREATE INDEX idx_item_master_name ON item_master(item_name COLLATE NOCASE) WHERE deleted = FALSE;

-- tag filtering and Tag Manager (item <-> tag lookups both directions)
CREATE INDEX idx_item_tag_links_item ON item_tag_links(item_uid) WHERE deleted = FALSE;
CREATE INDEX idx_item_tag_links_tag ON item_tag_links(item_tag_uid) WHERE deleted = FALSE;

-- color links
CREATE INDEX idx_color_tag_links_item ON color_tag_links(item_uid) WHERE deleted = FALSE;
CREATE INDEX idx_color_tag_links_color ON color_tag_links(color_uid) WHERE deleted = FALSE;

-- material links
CREATE INDEX idx_material_tag_links_item ON material_tag_links(item_uid) WHERE deleted = FALSE;

-- photos: item detail thumbnails, Photo Manager filters/sort
CREATE INDEX idx_photos_item ON photos(item_uid) WHERE deleted = FALSE;
CREATE INDEX idx_photos_created_at ON photos(created_at) WHERE deleted = FALSE;
CREATE INDEX idx_photo_item_links_item ON photo_item_links(item_uid) WHERE deleted = FALSE;
CREATE INDEX idx_photo_item_links_photo ON photo_item_links(photo_uid) WHERE deleted = FALSE;

-- builds
CREATE INDEX idx_builds_keyboard ON builds(build_keyboard_uid) WHERE deleted = FALSE;
CREATE INDEX idx_builds_keycap ON builds(build_keycap_uid) WHERE deleted = FALSE;
CREATE INDEX idx_builds_switch ON builds(build_switch_uid) WHERE deleted = FALSE;
CREATE INDEX idx_build_photo_links_build ON build_photo_links(build_uid) WHERE deleted = FALSE;
CREATE INDEX idx_build_photo_links_photo ON build_photo_links(photo_uid) WHERE deleted = FALSE;



/**     Create Default Records       **/
insert into item_types (    
    item_type_description,
    item_type_table,
    item_type_bitmap_value,
    item_links_to_keyboard,
    deleted
) values
    ('Keyboard', 'keyboard_master', 1,false),
    ('Keycaps', 'keycaps_master', 2, false),
    ('Switches', 'switches_master',4, false),
    ('Artisan', 'artisan_master', 8, false),
    ('PCB', 'pcb_master', 16, false),
    ('Plate', 'plate_master', 32, false);

insert into item_status (
    item_status_description,
    deleted
) values
    ('Ordered', false),
    ('Shipped', false),
    ('Possess', false),
    ('Sold', false),
    ('Want to sell', false);

insert into colors (
    color_desc,
    color_hex,
    deleted
) values
    ('Black', '#000000', false),
    ('White', '#FFFFFF', false),
    ('Red', '#FF0000', false),
    ('Green', '#00FF00', false),
    ('Blue', '#0000FF', false),
    ('Yellow', '#FFFF00', false),
    ('Gray', '#808080', false),
    ('Orange', '#FFA500', false),
    ('Purple', '#800080', false),
    ('Brown', '#A52A2A', false),
    ('Pink', '#FFC0CB', false),
    ('Lime', '#00FF00', false),
    ('Teal', '#008080', false),
    ('Navy', '#000080', false),
    ('Maroon', '#800000', false),
    ('Olive', '#808000', false),
    ('Silver', '#C0C0C0', false),
    ('Gold', '#FFD700', false),
    ('Beige', '#F5F5DC', false),
    ('Turquoise', '#40E0D0', false),
    ('Lavender', '#E6E6FA', false),
    ('Salmon', '#FA8072', false),
    ('Tan', '#D2B48C', false);



insert into keyboard_layouts (
    keyboard_layout_desc,
    keyboard_macro_columns,
    keyboard_has_f13
) values
    ( '40%', 0, false),
    ( '60%', 0, false),
    ( '65%', 0, false),
    ( '70%', 0, false),
    ( '75%', 0, false),
    ( '96%', 0, false),
    ( '100%', 0, false),
    ( '1800', 0);

insert into keycap_manufacture_methods (
    keycap_manufacture_method_desc,
    deleted
) values
    ('Dye Sublimation', false),
    ('Double Shot', false),
    ('Triple Shot', false),
    ('Laser Etched', false),
    ('Pad Printed', false),
    ('UV Printed', false),
    ('Hydro Dipped', false);

insert into materials (
    material_desc,
    material_applies_to,
    deleted
) values
    ('ABS', 2, false),
    ('PBT', 2, false),
    ('POM', 2, false),
    ('PC', 2, false),
    ('Aluminum', 1, false),
    ('Steel', 1, false),
    ('Brass', 1, false),
    ('Copper', 1, false),
    ('Titanium', 1, false),
    ('Zinc Alloy', 1, false),
    ('Resin', 8, false),
    ('Wood', 8, false),
    ('Ceramic', 8, false);

insert into keycap_profiles (
    keycap_profile_desc,
    deleted
) values
    ('OEM', false),
    ('Cherry', false),
    ('SA', false),
    ('DSA', false),
    ('XDA', false),
    ('MT3', false),
    ('KAT', false),
    ('JTK', false),
    ('DSA', false),
    ('DSA', false);

insert into photo_extentions (
    photo_extention_desc,
    photo_mime_type,
    photo_extention_displayable,
    deleted
) values
    ('JPEG', 'image/jpeg', true, false),
    ('PNG', 'image/png', true, false),
    ('GIF', 'image/gif', true, false),
    ('BMP', 'image/bmp', true, false),
    ('TIFF', 'image/tiff', true, false)
    ('HEIC', 'image/heic', true, false)

insert into keyboard_layouts (
    keyboard_layout_desc,
    deleted
) values
    ('40%', false),
    ('60%', false),
    ('65%', false),
    ('70%', false),
    ('75%', false),
    ('TKL', false),
    ('98%', false),
    ('100%', false),
    ('1800', false);

/*          Create Default Tags for items in the database          */

insert into item_tags (
    item_tag_desc,
    item_tag_availability,
    item_tag_deleted, 
) values
    ('Premium Manufacturer', 7, true, false),
    ('Designer', 7, '', false),
    ('Has Macro Keys', 2, false, false),
    ('Has Alert/Highlight/Accent', 2, false, false),
    ('Has Novelties', 2, false, false),
    ('Has Relegendable Keys', 2, false, false),
    ('Has Split Spacebars', 2, false, false),
    ('Has 10-Key Set', 2, true, false),
    ('Has RGB Lighting', 1, true, false),
    ('Has RGB Backlighting', 1, true, false);
    ('Has Split Spacebars', 2, false, false);
    ('Has 10-Keys', 2, true, false);
    ('Is Clone', 2, false, false),
    ('Has Icon Mods', 2, true, false),
    ('Has Relegendable Keys', 2, false, false);
    ('Has RGB Lighting', 1, false, false);
    ('Has RGB Backlighting', 1, false, false)
    ('Extra Sets - Novelties', 2, 0, false),
    ('Extra Sets - Spacebars', 2, 0, false);
    ('Extra Sets - Alphas', 2, 0, false);
    ('Extra Sets - Mods', 2, 0, false);
    ('Extra Sets - Macro Keys', 2, 0, false);
    ('Extra Sets - Relegendables', 2, 0, false);
    ('Extra Sets - Alert/Highlight/Accent', 2, 0, false);
    ('Extras - Artisans', 2, 0, false);
    ('Keycap Material', 2, 'ABS', false);
    ('Keyboard Material', 2, '', false);
    ('Keycap Production Method', 2, 'Doubleshot', false);
    ('Keycap Profile', 2, '', false) ;
    ('Keycap Thickness', 2, 0, false);
    ('Condition', 2, 'New', false)
    ('Condition Notes', 7, '', false);
    ('Purchased New', 2, true, false);
    ('Macro Columns', 2, 0, false);
    ('Has F13 Key', 2, , 0, false);

insert into db_version (
    db_version_number,
    deleted
) values
    (VERSION_NUMBER, false);

insert into switch_types (
    switch_type_desc,
    deleted
) values
    ('Linear', false),
    ('Tactile', false),
    ('Clicky', false),
    ('Optical', false),
    ('Hall Effect', false),
    ('Capacitive', false),
    ('Electrostatic', false),
    ('Magnetic', false),
    ('Hybrid', false),
    ('Other', false);

insert into keyboard_finish_types (
    keyboard_finish_type_desc,
    deleted
) values
    ('Anodized', false),
    ('Powder Coated', false),
    ('Electrostatic Painted', false),
    ('raw', false),
    ('Other', false);

insert into entity_types (
    entity_type_desc,
    entity_type_table,
    entity_type_bitmap_value,
    deleted
) values
    ('Keyboard', 'keyboard_master', 1, false),
    ('Keycap', 'keycaps_master', 2, false),
    ('Switch', 'switches_master', 4, false),
    ('Artisan', 'artisan_master', 8, false),
    ('PCB', 'pcb_master', 16, false),
    ('Plate', 'plate_master', 32, false);

