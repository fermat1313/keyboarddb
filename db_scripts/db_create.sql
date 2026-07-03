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



/*          Create Database and set up schema for keyboardDB          */
CREATE TABLE item_master (
    item_uid BLOB PRIMARY KEY,
    item_type_uid BLOB NOT NULL,
    item_name TEXT NOT NULL,
    manufacturer_uid BLOB NOT NULL,
    item_purchase_date DATE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    item_vendor_uid BLOB,
    item_seller_name TEXT,
    item_price DECIMAL(10,2) NOT NULL,
    item_status_uid BLOB NOT NULL,
    item_version TEXT,
    item_notes TEXT,
    item_deleted BOOLEAN DEFAULT FALSE NOT NULL,created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
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

create table item_status (
    item_status_uid BLOB PRIMARY KEY,
    item_status_description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table designers (
    designer_uid BLOB PRIMARY KEY,
    designer_name TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table item_types (
    item_type_uid BLOB PRIMARY KEY,
    item_type_description TEXT NOT NULL,
    item_type_table TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
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

create table keyboard_materials (
    keyboard_material_uid BLOB PRIMARY KEY,
    keyboard_material_desc TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table keycap_materials (
    keycap_material_uid BLOB PRIMARY KEY,
    keycap_material_desc TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table keyboard_layouts (
    keyboard_layout_uid BLOB PRIMARY KEY,
    keyboard_layout_windows_key TEXT NOT NULL,
    keyboard_layout_size INT NOT NULL,     -- Check on this...
    keyboard_layout_macro_columns INT NOT NULL,
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

create table item_tags (
    item_tag_uid BLOB PRIMARY KEY,
    item_tag_desc TEXT NOT NULL,
    item_tag_availability INT DEFAULT 0 NOT NULL,
    item_tag_type text,
    item_tag_boolean BOOLEAN DEFAULT FALSE,
    item_tag_int INT,
    item_tag_text TEXT,
    item_tag_float Decimal(10,2),
    item_tag_blob BLOB,
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
);

create table color_tag_links (
    item_color_tag_link_uid BLOB PRIMARY KEY,
    item_color_link_uid BLOB NOT NULL,
    item_uid BLOB NOT NULL,
    color_uid BLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table material_tag_links (
    item_material_tag_link_uid BLOB PRIMARY KEY,
    item_material_link_uid BLOB NOT NULL,
    item_uid BLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
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
);

create table photo_item_links (
    photo_item_link_uid BLOB PRIMARY KEY,
    photo_uid BLOB NOT NULL,
    item_uid BLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
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

create table keyboard_layouts (
    keyboard_layout_uid BLOB PRIMARY KEY,
    keyboard_layout_desc TEXT NOT NULL,
    keyboard_macro_columns INT NOT NULL,
    keyboard_has_f13 BOOLEAN DEFAULT FALSE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table builds (
    build_uid BLOB PRIMARY KEY,
    build_name TEXT NOT NULL,
    build_keyboard_uid BLOB NOT NULL,
    build_keycap_uid BLOB NOT NULL,
    build_switch_uid BLOB NOT NULL,
    build_notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);

create table build_photo_links (
    build_photo_link_uid BLOB PRIMARY KEY,
    build_uid BLOB NOT NULL,
    photo_uid BLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);



/**             Create Default Records                **/
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

insert into keyboard_materials (
    keyboard_material_desc,
    deleted
) values
    ('Aluminum', false),
    ('Extruded Plastic', false),
    ('Extruded Acrylic', false),
    ('CNC Acrylic', false),
    ('Wood', false),
    ('Brass', false),
    ('Copper', false),
    ('Titanium', false),
    ('Resin', false),
    ('ABS', false);

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


insert into keycap_materials (
    keycap_material_desc,
    deleted
) values
    ('ABS', false),
    ('PBT', false),
    ('POM', false),
    ('Polycarbonate', false),
    ('Resin', false),
    ('Metal', false),
    ('Wood', false);

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
    ('96%', false),
    ('100%', false),
    ('1800', false);

/*          Create Default Tags for items in the database          */

insert into item_tags (
    item_tag_desc,
    item_tag_availability,
    item_tag_type,
    item_tag_boolean,
    item_tag_int,
    item_tag_text,
    item_tag_float,
    item_tag_blob,
    deleted
) values
    ('Premium Manufacturer', 7, 'boolean', true, null, null, null, null, false),
    ('Designer', 7, 'text', null, null, 'Designer Name', null, null, false),
    ('Has Novelties', 2, 'boolean', false, null, null, null, null, false),
    ('Has Split Spacebars', 2, 'boolean', false, null, null, null, null, false),
    ('Has 10-Key Set', 2, 'boolean', false, null, null, null, null, false),
    ('Is Clone', 2, 'boolean', false, null, null, null, null, false),
    ('Has Icon Mods', 2, 'boolean', false, null, null, null, null, false);
    ('Has Relegendable Keys', 2, 'boolean', false, null, null, null, null, false);
    ('Has RGB Lighting', 1, 'boolean', false, null, null, null, null, false);
    ('Has Backlighting', 1, 'boolean', false, null, null, null, null, false);
    ('Extra Sets - Novelties', 2, 'int', null, 0, null, null, null, false);
    ('Extra Sets - Spacebars', 2, 'int', null, 0, null, null, null, false);
    ('Extra Sets - Alphas', 2, 'int', null, 0, null, null, null, false);
    ('Extra Sets - Number Set', 2, 'int', null, 0, null, null, null, false);
    ('Extra Sets - Macro Keys', 2, 'int', null, 0, null, null, null, false);
    ('Extra Sets - Relegendable Keys', 2, 'int', null, 0, null, null, null, false);
    ('Extra Sets - Alert/Highlight/Accent', 2, 'int', null, 0, null, null, null, false);
    ('Extras - Artisans', 2, 'int', null, 0, null, null, null, false);
    ('Keycap_material', 2, 'text', null, null, 'ABS', null, null, false);
    ('Keyboard_material', 2, 'text', null, null, 'Aluminum', null, null, false);
    ('Keycap_method', 2, 'text', null, null, 'Dye Sublimation', null, null, false);
    ('Keycap_profile', 2, 'text', null, null, 'OEM', null, null, false);
    ('Keycap_thickness', 2, 'float', null, null, null, 1.5, null, false);
    ('Condition', 2, 'text', null, null, 'New', null, null, false);
    ('Condition Notes', 2, 'text', null, null, '', null, null, false);
