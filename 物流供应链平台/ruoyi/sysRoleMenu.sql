-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('角色', '3', '1', '/platform/sysRole', 'C', '0', 'platform:sysRole:view', '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '角色菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu  (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('角色查询', @parentId, '1',  '#',  'F', '0', 'platform:sysRole:list',         '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('角色新增', @parentId, '2',  '#',  'F', '0', 'platform:sysRole:add',          '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('角色修改', @parentId, '3',  '#',  'F', '0', 'platform:sysRole:edit',         '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('角色删除', @parentId, '4',  '#',  'F', '0', 'platform:sysRole:remove',       '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');
