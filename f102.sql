set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 102 - Lovas_Tábor
--
-- Application Export:
--   Application:     102
--   Name:            Lovas_Tábor
--   Date and Time:   13:06 Sunday October 13, 2013
--   Exported By:     MAGYAR
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         4.2.2.00.11
--   Instance ID:     63421741252745
--
-- Import:
--   Using Application Builder
--   or
--   Using SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application
 
-- Application Statistics:
--   Pages:                      3
--     Items:                    7
--     Processes:                4
--     Regions:                  5
--     Buttons:                  1
--   Shared Components:
--     Logic:
--     Navigation:
--       Tab Sets:               1
--         Tabs:                 2
--       Breadcrumbs:            1
--         Entries:              1
--       NavBar Entries:         1
--     Security:
--       Authentication:         1
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                15
--         Region:              30
--         Label:                5
--         List:                20
--         Popup LOV:            1
--         Calendar:             3
--         Breadcrumb:           2
--         Button:               7
--         Report:              10
--     Globalization:
--     Reports:
 
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application.
  wwv_flow_api.set_security_group_id(p_security_group_id=>nvl(wwv_flow_application_install.get_workspace_id,2152319838060054));
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2012.01.01');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,102);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

--application/delete_application
 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(nvl(wwv_flow_application_install.get_application_id,102));
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(nvl(wwv_flow_application_install.get_application_id,102));
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

--application/create_application
 
begin
 
wwv_flow_api.create_flow(
  p_id    => nvl(wwv_flow_application_install.get_application_id,102),
  p_display_id=> nvl(wwv_flow_application_install.get_application_id,102),
  p_owner => nvl(wwv_flow_application_install.get_schema,'SEMA1'),
  p_name  => nvl(wwv_flow_application_install.get_application_name,'Lovas_Tábor'),
  p_alias => nvl(wwv_flow_application_install.get_application_alias,'F_102'),
  p_page_view_logging => 'YES',
  p_page_protection_enabled_y_n=> 'Y',
  p_checksum_salt_last_reset => '20131013130256',
  p_max_session_length_sec=> null,
  p_compatibility_mode=> '4.2',
  p_html_escaping_mode=> 'E',
  p_flow_language=> 'hu',
  p_flow_language_derived_from=> 'FLOW_PRIMARY_LANGUAGE',
  p_allow_feedback_yn=> 'N',
  p_date_format=> 'YYYY-MM-DD',
  p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,''),
  p_publish_yn=> 'N',
  p_documentation_banner=> '',
  p_authentication=> 'PLUGIN',
  p_authentication_id=> 2314503765365867 + wwv_flow_api.g_id_offset,
  p_logout_url=> '',
  p_application_tab_set=> 0,
  p_logo_image => 'TEXT:Lovas_Tábor',
  p_public_url_prefix => '',
  p_public_user=> '',
  p_dbauth_url_prefix => '',
  p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,''),
  p_cust_authentication_process=> '',
  p_cust_authentication_page=> '',
  p_flow_version=> 'release 1.0',
  p_flow_status=> 'AVAILABLE_W_EDIT_LINK',
  p_flow_unavailable_text=> '',
  p_build_status=> 'RUN_AND_BUILD',
  p_exact_substitutions_only=> 'Y',
  p_browser_cache=>'N',
  p_browser_frame=>'D',
  p_deep_linking=>'Y',
  p_vpd=> '',
  p_vpd_teardown_code=> '',
  p_authorize_public_pages_yn=>'N',
  p_csv_encoding=> 'Y',
  p_include_legacy_javascript=> 'Y',
  p_default_error_display_loc=> 'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_last_updated_by => 'MAGYAR',
  p_last_upd_yyyymmddhh24miss=> '20131013130256',
  p_ui_type_name => null,
  p_required_roles=> wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

----------------
--package app map
--
prompt  ...user interfaces
--
 
begin
 
--application/user interface/desktop
wwv_flow_api.create_user_interface (
  p_id => 2314329887365668 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_ui_type_name => 'DESKTOP'
 ,p_display_name => 'Desktop'
 ,p_display_seq => 10
 ,p_use_auto_detect => false
 ,p_is_default => true
 ,p_theme_id => 22
 ,p_home_url => 'f?p=&APP_ID.:1:&SESSION.'
 ,p_login_url => 'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
  );
null;
 
end;
/

prompt  ...plug-in settings
--
 
begin
 
--application/plug-in setting/item_type_native_yes_no
wwv_flow_api.create_plugin_setting (
  p_id => 2304828828365215 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_YES_NO'
 ,p_attribute_01 => 'Y'
 ,p_attribute_03 => 'N'
  );
null;
 
end;
/

prompt  ...authorization schemes
--
 
begin
 
null;
 
end;
/

--application/shared_components/navigation/navigation_bar
prompt  ...navigation bar entries
--
 
begin
 
wwv_flow_api.create_icon_bar_item(
  p_id => 2314423741365817 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 200,
  p_icon_image => '',
  p_icon_subtext=> 'Logout',
  p_icon_target=> '&LOGOUT_URL.',
  p_icon_image_alt=> 'Logout',
  p_icon_height=> 32,
  p_icon_width=> 32,
  p_icon_height2=> 24,
  p_icon_width2=> 24,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '',
  p_icon_bar_disp_cond_type=> '',
  p_begins_on_new_line=> '',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
 
end;
/

prompt  ...application processes
--
prompt  ...application items
--
prompt  ...application level computations
--
 
begin
 
null;
 
end;
/

prompt  ...Application Tabs
--
 
begin
 
--application/shared_components/navigation/tabs/standard/t_home
wwv_flow_api.create_tab (
  p_id=> 2315911866366190 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 10,
  p_tab_name=> 'T_HOME',
  p_tab_text => 'Home',
  p_tab_step => 1,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/táblák_megjelenítése
wwv_flow_api.create_tab (
  p_id=> 2320702410315278 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 20,
  p_tab_name=> 'Táblák Megjelenítése',
  p_tab_text => 'Táblák Megjelenítése',
  p_tab_step => 2,
  p_tab_also_current_for_pages => '2',
  p_tab_parent_tabset=>'',
  p_tab_comment  => '');
 
 
end;
/

prompt  ...Application Parent Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Shared Lists of values
--
prompt  ...Application Trees
--
--application/pages/page_groups
prompt  ...page groups
--
 
begin
 
null;
 
end;
/

--application/comments
prompt  ...comments: requires application express 2.2 or higher
--
 
--application/pages/page_00001
prompt  ...PAGE 1: Home
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1
 ,p_user_interface_id => 2314329887365668 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'TS1'
 ,p_name => 'Home'
 ,p_step_title => 'Home'
 ,p_step_sub_title => 'Home'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_upd_yyyymmddhh24miss => '20131006143449'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 2316121149366229 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Breadcrumbs',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 2306805403365368+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(2315620852366139 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 2313608974365556+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00002
prompt  ...PAGE 2: Táblák Megtekintése
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 2
 ,p_user_interface_id => 2314329887365668 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'TS1'
 ,p_name => 'Táblák Megtekintése'
 ,p_step_title => 'Táblák Megtekintése'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'MAGYAR'
 ,p_last_upd_yyyymmddhh24miss => '20131013130256'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 2320816810333200 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Vezérlők Helye',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 2308330636365382+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'BEGIN'||unistr('\000a')||
''||unistr('\000a')||
'for i in (SELECT column_name FROM all_tab_columns where upper(table_name) = upper(:P2_TV) ORDER BY 1)'||unistr('\000a')||
'LOOP'||unistr('\000a')||
'htp.p(APEX_ITEM.CHECKBOX(1,i.column_name)||i.column_name||''<br />'');'||unistr('\000a')||
'END LOOP;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 2332609251562853 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Elévült: Oszlop választó',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 2308330636365382+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'FUNCTION_BODY',
  p_plug_display_when_condition => 'BEGIN'||unistr('\000a')||
'--elévült'||unistr('\000a')||
'return false;'||unistr('\000a')||
'if :P2_TV = ''0'' THEN'||unistr('\000a')||
'return false;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'return true;'||unistr('\000a')||
'end if;'||unistr('\000a')||
'END;',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'htp.p(''P2_TV: ''||:P2_TV||''<br />'');'||unistr('\000a')||
'htp.p(''P2_CHK_OSZLOPOK: ''||:P2_CHK_OSZLOPOK||''<br />'');'||unistr('\000a')||
'htp.p(''P2_RDO_SORT: ''|| :P2_RDO_SORT ||''<br />'');'||unistr('\000a')||
'htp.p(''P2_TB_SORT_FIELD: ''|| :P2_TB_SORT_FIELD ||''<br />'');';

wwv_flow_api.create_page_plug (
  p_id=> 2354218302625104 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Teszt',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 2308330636365382+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 2353817516568106 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 2,
  p_button_sequence=> 10,
  p_button_plug_id => 2320816810333200+wwv_flow_api.g_id_offset,
  p_button_name    => 'P2_BTN_MEHET',
  p_button_action  => 'SUBMIT',
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Lekérdez',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>2326403512012904 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_TV',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 2320816810333200+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Táblaválasztó',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select distinct table_name, table_name as "a" from all_tab_columns where owner = ''SEMA1'' and table_name not like ''APEX%'' AND table_name not like ''DEMO%'';',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'-- Válasszon táblát --',
  p_lov_null_value=> '0',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 2312603537365515+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'SUBMIT',
  p_attribute_03 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>2346424632191996 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CHK_OSZLOPOK',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 2320816810333200+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Oszlopok',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_CHECKBOX',
  p_lov=> 'select column_name as val, column_name from all_tab_columns where owner = ''SEMA1'' AND table_name = :P2_TV',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'BEGIN'||unistr('\000a')||
'if :P2_TV = ''0'''||unistr('\000a')||
'THEN return false;'||unistr('\000a')||
'else'||unistr('\000a')||
'return true;'||unistr('\000a')||
'end if;'||unistr('\000a')||
'END;',
  p_display_when_type=>'FUNCTION_BODY',
  p_field_template=> 2312526594365514+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '1',
  p_attribute_02 => 'HORIZONTAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>2352217608347184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_RDO_SORT',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 2320816810333200+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Rendezés',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_lov=> 'STATIC:NO,ASC,DESC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'BEGIN'||unistr('\000a')||
'if :P2_CHK_OSZLOPOK = '''' then'||unistr('\000a')||
'return false;'||unistr('\000a')||
'else'||unistr('\000a')||
'return true;'||unistr('\000a')||
'end if;'||unistr('\000a')||
'END;',
  p_display_when_type=>'FUNCTION_BODY',
  p_field_template=> 2312603537365515+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '1',
  p_attribute_02 => 'SUBMIT',
  p_attribute_03 => 'Y',
  p_attribute_04 => 'HORIZONTAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>2352519512391860 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_TB_SORT_FIELD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 2320816810333200+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Rendező Oszlop',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_AUTO_COMPLETE',
  p_lov=> 'select column_name from all_tab_columns where owner = ''SEMA1'' AND table_name = :P2_TV',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 80,
  p_cMaxlength=> 4000,
  p_cHeight=> 5,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'BEGIN'||unistr('\000a')||
'if :P2_RDO_SORT = ''NO'' then'||unistr('\000a')||
'return false;'||unistr('\000a')||
'else'||unistr('\000a')||
'return true;'||unistr('\000a')||
'end if;'||unistr('\000a')||
'END;',
  p_display_when_type=>'FUNCTION_BODY',
  p_field_template=> 2312526594365514+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'CONTAINS_IGNORE',
  p_attribute_04 => 'N',
  p_attribute_06 => 'N',
  p_attribute_07 => 'Y',
  p_attribute_08 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 2
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00101
prompt  ...PAGE 101: Login
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 101
 ,p_user_interface_id => 2314329887365668 + wwv_flow_api.g_id_offset
 ,p_name => 'Login'
 ,p_alias => 'LOGIN_DESKTOP'
 ,p_step_title => 'Login'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_step_template => 2304930986365265 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_cache_page_yn => 'N'
 ,p_last_upd_yyyymmddhh24miss => '20131006143447'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 2314811743365931 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 101,
  p_plug_name=> 'Login',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 2307410395365368+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>2314901838366015 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_USERNAME',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 2314811743365931+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_prompt=>'Username',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 2312603537365515+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>2315016322366043 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_PASSWORD',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 2314811743365931+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_prompt=>'Password',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 2312603537365515+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>2315132691366096 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_LOGIN',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 2314811743365931+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default=> 'Login',
  p_prompt=>'Login',
  p_source=>'LOGIN',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(2312915180365529 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'apex_authentication.send_login_username_cookie ('||unistr('\000a')||
'    p_username => lower(:P101_USERNAME) );';

wwv_flow_api.create_page_process(
  p_id     => 2315309137366132 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Set Username Cookie',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'apex_authentication.login('||unistr('\000a')||
'    p_username => :P101_USERNAME,'||unistr('\000a')||
'    p_password => :P101_PASSWORD );';

wwv_flow_api.create_page_process(
  p_id     => 2315222956366096 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Login',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'101';

wwv_flow_api.create_page_process(
  p_id     => 2315525657366139 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Clear Page(s) Cache',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||':P101_USERNAME := apex_authentication.get_login_username_cookie;';

wwv_flow_api.create_page_process(
  p_id     => 2315407012366134 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get Username Cookie',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 101
--
 
begin
 
null;
end;
null;
 
end;
/

prompt  ...lists
--
--application/shared_components/navigation/breadcrumbs
prompt  ...breadcrumbs
--
 
begin
 
wwv_flow_api.create_menu (
  p_id=> 2315620852366139 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> ' Breadcrumb');
 
wwv_flow_api.create_menu_option (
  p_id=>2316015978366195 + wwv_flow_api.g_id_offset,
  p_menu_id=>2315620852366139 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Home',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.',
  p_page_id=>1,
  p_also_current_for_pages=> '');
 
null;
 
end;
/

prompt  ...page templates for application: 102
--
--application/shared_components/user_interface/templates/page/login
prompt  ......Page template 2304930986365265
 
begin
 
wwv_flow_api.create_template (
  p_id => 2304930986365265 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 22
 ,p_name => 'Login'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''
 ,p_box => 
'<div id="login">'||unistr('\000a')||
'  <div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'  <div id="login-main">#REGION_POSITION_02##BOX_BODY##REGION_POSITION_03#</div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''
 ,p_footer_template => 
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0"'
 ,p_theme_class_id => 6
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
 ,p_template_comment => '18'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_left_sidebar_fixed_width_div_based
prompt  ......Page template 2305018917365292
 
begin
 
wwv_flow_api.create_template (
  p_id => 2305018917365292 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 22
 ,p_name => 'No Tabs - Left Sidebar (fixed-width / DIV based)'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''
 ,p_box => 
'<div id="header">'||unistr('\000a')||
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <div id="navbar">'||unistr('\000a')||
'    #NAVIGATION_BAR#'||unistr('\000a')||
'    <div class="app-user">#WELCOME_USER#</div>'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="tabs">'||unistr('\000a')||
'  <div class="frame">'||unistr('\000a')||
'    <div class="bg">'||unistr('\000a')||
'      <div class="tab-holder">'||unistr('\000a')||
'        &nbsp;'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="'||
'topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>'||unistr('\000a')||
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'<div id="body">'||unistr('\000a')||
'  <div id="two-col-sb-left">'||unistr('\000a')||
'    <div id="left-sidebar">#REGION_POSITION_02#</div>'||unistr('\000a')||
'    <div id="main-sb-left">'||unistr('\000a')||
'      #BOX_BODY##REGION_POSITION_03#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<div id="footer"><div class="content">'||unistr('\000a')||
'<div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'<div class="app-version">#APP_VERSION#</div>'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'  #REGION_POSITION_05#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_region_table_cattributes => 'summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 17
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_left_and_right_sidebar_fixed_width_div_left_and_optional_table_based_right
prompt  ......Page template 2305113653365296
 
begin
 
wwv_flow_api.create_template (
  p_id => 2305113653365296 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 22
 ,p_name => 'No Tabs - Left and Right Sidebar (fixed-width / DIV left and optional table-based right)'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''
 ,p_box => 
'<div id="header">'||unistr('\000a')||
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <div id="navbar">'||unistr('\000a')||
'    <div class="app-user">#WELCOME_USER#</div>'||unistr('\000a')||
'    #NAVIGATION_BAR#'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="tabs">'||unistr('\000a')||
'  <div class="frame">'||unistr('\000a')||
'    <div class="bg">'||unistr('\000a')||
'      <div class="tab-holder">'||unistr('\000a')||
'        &nbsp;'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="'||
'topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>'||unistr('\000a')||
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'<div id="body">'||unistr('\000a')||
'  <div id="three-col">'||unistr('\000a')||
'    <div id="left-sidebar">#REGION_POSITION_02#</div>'||unistr('\000a')||
'    <div id="two-col-tbl">'||unistr('\000a')||
'      <table class="tbl-body" cellspacing="0" cellpadding="0" border="0" summary="">'||unistr('\000a')||
'        <tbody>'||unistr('\000a')||
'          <tr>'||unistr('\000a')||
'            <td class="'||
'tbl-main" width="100%">#BOX_BODY#</td>'||unistr('\000a')||
'            <td class="tbl-sidebar">#REGION_POSITION_03#</td>     '||unistr('\000a')||
'          </tr>'||unistr('\000a')||
'        </tbody>'||unistr('\000a')||
'      </table>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<div id="footer"><div class="content">'||unistr('\000a')||
'<div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'<div class="app-version">#APP_VERSION#</div>'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'  #REGION_POSITION_05#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_region_table_cattributes => 'summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 17
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_right_sidebar_fixed_width_div_based
prompt  ......Page template 2305220733365296
 
begin
 
wwv_flow_api.create_template (
  p_id => 2305220733365296 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 22
 ,p_name => 'No Tabs - Right Sidebar (fixed-width / DIV based)'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''
 ,p_box => 
'<div id="header">'||unistr('\000a')||
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <div id="navbar">'||unistr('\000a')||
'    <div class="app-user">#WELCOME_USER#</div>'||unistr('\000a')||
'    #NAVIGATION_BAR#'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="tabs">'||unistr('\000a')||
'  <div class="frame">'||unistr('\000a')||
'    <div class="bg">'||unistr('\000a')||
'      <div class="tab-holder">'||unistr('\000a')||
'        &nbsp;'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="'||
'topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>'||unistr('\000a')||
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'<div id="body">'||unistr('\000a')||
'  <div id="two-col">'||unistr('\000a')||
'    <div id="sidebar">#REGION_POSITION_03#</div>     '||unistr('\000a')||
'    <div id="main">#REGION_POSITION_02##BOX_BODY#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''
 ,p_footer_template => 
'<div id="footer"><div class="content">'||unistr('\000a')||
'<div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'<div class="app-version">#APP_VERSION#</div>'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'  #REGION_POSITION_05#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 3
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_right_sidebar_optional_table_based
prompt  ......Page template 2305306700365301
 
begin
 
wwv_flow_api.create_template (
  p_id => 2305306700365301 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 22
 ,p_name => 'No Tabs - Right Sidebar (optional / table-based)'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''
 ,p_box => 
'<div id="header">'||unistr('\000a')||
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <div id="navbar">'||unistr('\000a')||
'    <div class="app-user">#WELCOME_USER#</div>'||unistr('\000a')||
'    #NAVIGATION_BAR#'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="tabs">'||unistr('\000a')||
'  <div class="frame">'||unistr('\000a')||
'    <div class="bg">'||unistr('\000a')||
'      <div class="tab-holder">'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="topbar">#REGION'||
'_POSITION_01##REGION_POSITION_04#</div>'||unistr('\000a')||
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'<div id="body">'||unistr('\000a')||
'  <table class="tbl-body" cellspacing="0" cellpadding="0" border="0" summary="">'||unistr('\000a')||
'    <tbody>'||unistr('\000a')||
'      <tr>'||unistr('\000a')||
'        <td class="tbl-main" width="100%">#REGION_POSITION_02##BOX_BODY#</td>'||unistr('\000a')||
'        <td class="tbl-sidebar">#REGION_POSITION_03#</td>     '||unistr('\000a')||
'      </tr>'||unistr('\000a')||
' '||
'   </tbody>'||unistr('\000a')||
'  </table>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<div id="footer"><div class="content">'||unistr('\000a')||
'<div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'<div class="app-version">#APP_VERSION#</div>'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'  #REGION_POSITION_05#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 3
 ,p_error_page_template => '<div class="error_container">'||unistr('\000a')||
'	<div class="rounded-corner-region-blank-alt">'||unistr('\000a')||
'		<div class="rc-gray-top">'||unistr('\000a')||
'			<div class="rc-gray-top-r"></div>'||unistr('\000a')||
'		</div>'||unistr('\000a')||
'		<div class="rc-body">'||unistr('\000a')||
'			<div class="rc-body-r">'||unistr('\000a')||
'				<div class="rc-content-main">'||unistr('\000a')||
'					<div class="sErrorText">'||unistr('\000a')||
'					<strong>#MESSAGE#</strong>'||unistr('\000a')||
'					<strong>#ADDITIONAL_INFO#</strong>'||unistr('\000a')||
'					<div>#TECHNICAL_INFO#</div>'||unistr('\000a')||
'					<p>'||unistr('\000a')||
'						<button onclick="#BACK_LINK#" class="button-default" type="button">'||unistr('\000a')||
'						  <span>#OK#</span>'||unistr('\000a')||
'						</button>'||unistr('\000a')||
'					</p>'||unistr('\000a')||
'					</div>'||unistr('\000a')||
'					<div class="clear"></div>'||unistr('\000a')||
'				</div>'||unistr('\000a')||
'				<div class="clear"></div>'||unistr('\000a')||
'			</div>'||unistr('\000a')||
'		</div>'||unistr('\000a')||
'		<div class="rc-bottom">'||unistr('\000a')||
'			<div class="rc-bottom-r"></div>'||unistr('\000a')||
'		</div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'</div>'
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_left_sidebar_fixed_width_div_based
prompt  ......Page template 2305408425365303
 
begin
 
wwv_flow_api.create_template (
  p_id => 2305408425365303 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 22
 ,p_name => 'One Level Tabs - Left Sidebar (fixed-width / DIV based)'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''
 ,p_box => 
'<div id="header">'||unistr('\000a')||
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <div id="navbar">'||unistr('\000a')||
'    <div class="app-user">#WELCOME_USER#</div>'||unistr('\000a')||
'    #NAVIGATION_BAR#'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<ul id="tabs">'||unistr('\000a')||
'#TAB_CELLS#'||unistr('\000a')||
'<li class="last"><span></span></li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>'||unistr('\000a')||
'<div id="messages">#S'||
'UCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'<div id="body">'||unistr('\000a')||
'  <div id="two-col-sb-left">'||unistr('\000a')||
'    <div id="left-sidebar">#REGION_POSITION_02#</div>'||unistr('\000a')||
'    <div id="main-sb-left">'||unistr('\000a')||
'      #BOX_BODY##REGION_POSITION_03#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<div id="footer"><div class="content">'||unistr('\000a')||
'<div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'<div class="app-version">#APP_VERSION#</div>'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'  #REGION_POSITION_05#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_non_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 16
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_left_and_right_sidebar_fixed_width_div_left_and_optional_table_based_right
prompt  ......Page template 2305520186365304
 
begin
 
wwv_flow_api.create_template (
  p_id => 2305520186365304 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 22
 ,p_name => 'One Level Tabs - Left and Right Sidebar (fixed-width / DIV left and optional table-based right)'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''
 ,p_box => 
'<div id="header">'||unistr('\000a')||
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <div id="navbar">'||unistr('\000a')||
'    <div class="app-user">#WELCOME_USER#</div>'||unistr('\000a')||
'    #NAVIGATION_BAR#'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<ul id="tabs">'||unistr('\000a')||
'#TAB_CELLS#'||unistr('\000a')||
'<li class="last"><span></span></li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>'||unistr('\000a')||
'<div id="messages">#S'||
'UCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'<div id="body">'||unistr('\000a')||
'  <div id="three-col">'||unistr('\000a')||
'    <div id="left-sidebar">#REGION_POSITION_02#</div>'||unistr('\000a')||
'    <div id="two-col-tbl">'||unistr('\000a')||
'      <table class="tbl-body" cellspacing="0" cellpadding="0" border="0" summary="">'||unistr('\000a')||
'        <tbody>'||unistr('\000a')||
'          <tr>'||unistr('\000a')||
'            <td class="tbl-main" width="100%">#BOX_BODY#</td>'||unistr('\000a')||
'            <td class="tbl-sidebar">#'||
'REGION_POSITION_03#</td>     '||unistr('\000a')||
'          </tr>'||unistr('\000a')||
'        </tbody>'||unistr('\000a')||
'      </table>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<div id="footer"><div class="content">'||unistr('\000a')||
'<div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'<div class="app-version">#APP_VERSION#</div>'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'  #REGION_POSITION_05#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_non_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 16
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_right_sidebar_fixed_width_div_based
prompt  ......Page template 2305628887365304
 
begin
 
wwv_flow_api.create_template (
  p_id => 2305628887365304 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 22
 ,p_name => 'One Level Tabs - Right Sidebar (fixed-width / DIV based)'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''
 ,p_box => 
'<div id="header">'||unistr('\000a')||
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <div id="navbar">'||unistr('\000a')||
'    <div class="app-user">#WELCOME_USER#</div>'||unistr('\000a')||
'    #NAVIGATION_BAR#'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<ul id="tabs">'||unistr('\000a')||
'#TAB_CELLS#'||unistr('\000a')||
'<li class="last"><span></span></li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>'||unistr('\000a')||
'<div id="messages">#S'||
'UCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'<div id="body">'||unistr('\000a')||
'  <div id="two-col">'||unistr('\000a')||
'    <div id="sidebar">#REGION_POSITION_03#</div>     '||unistr('\000a')||
'    <div id="main">#REGION_POSITION_02##BOX_BODY#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''
 ,p_footer_template => 
'<div id="footer"><div class="content">'||unistr('\000a')||
'<div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'<div class="app-version">#APP_VERSION#</div>'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'  #REGION_POSITION_05#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_non_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 8
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_right_sidebar_optional_table_based
prompt  ......Page template 2305701644365307
 
begin
 
wwv_flow_api.create_template (
  p_id => 2305701644365307 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 22
 ,p_name => 'One Level Tabs - Right Sidebar (optional / table-based)'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''
 ,p_box => 
'<div id="header">'||unistr('\000a')||
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <div id="navbar">'||unistr('\000a')||
'    <div class="app-user">#WELCOME_USER#</div>'||unistr('\000a')||
'    #NAVIGATION_BAR#'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<ul id="tabs">'||unistr('\000a')||
'#TAB_CELLS#'||unistr('\000a')||
'<li class="last"><span></span></li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>'||unistr('\000a')||
'<div id="messages">#S'||
'UCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'<div id="body">'||unistr('\000a')||
'  <table class="tbl-body" cellspacing="0" cellpadding="0" border="0" summary="">'||unistr('\000a')||
'    <tbody>'||unistr('\000a')||
'      <tr>'||unistr('\000a')||
'        <td class="tbl-main" width="100%">#REGION_POSITION_02##BOX_BODY#</td>'||unistr('\000a')||
'        <td class="tbl-sidebar">#REGION_POSITION_03#</td>     '||unistr('\000a')||
'      </tr>'||unistr('\000a')||
'    </tbody>'||unistr('\000a')||
'  </table>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<div id="footer"><div class="content">'||unistr('\000a')||
'<div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'<div class="app-version">#APP_VERSION#</div>'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'  #REGION_POSITION_05#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_non_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a href="#LINK#" class="navbar-link">#TEXT#</a></div>'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 1
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/popup
prompt  ......Page template 2305832641365307
 
begin
 
wwv_flow_api.create_template (
  p_id => 2305832641365307 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 22
 ,p_name => 'Popup'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'<link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD# class="pop-up-body">#FORM_OPEN#'
 ,p_box => 
'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign="top"><div class="t1messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_footer_template => 
'#FORM_CLOSE##DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>'
 ,p_notification_message => '<div class="t1notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_theme_class_id => 4
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/printer_friendly
prompt  ......Page template 2305901539365310
 
begin
 
wwv_flow_api.create_template (
  p_id => 2305901539365310 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 22
 ,p_name => 'Printer Friendly'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'
 ,p_box => 
'<div id="header">'||unistr('\000a')||
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <div id="navbar">'||unistr('\000a')||
'    <div class="app-user">#WELCOME_USER#</div>'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="body">'||unistr('\000a')||
'  <table class="tbl-body" cellspacing="0" cellpadding="0" border="0" summary="">'||unistr('\000a')||
'    <tbody>'||unistr('\000a')||
'      <tr>'||unistr('\000a')||
'        <td class="tbl-sidebar" style="padding-right: 1'||
'0px;">#REGION_POSITION_02#</td>     '||unistr('\000a')||
'        <td class="tbl-main" width="100%">#BOX_BODY#</td>'||unistr('\000a')||
'        <td class="tbl-sidebar">#REGION_POSITION_03#</td>     '||unistr('\000a')||
'      </tr>'||unistr('\000a')||
'    </tbody>'||unistr('\000a')||
'  </table>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''
 ,p_footer_template => 
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_theme_class_id => 5
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
 ,p_template_comment => '3'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_left_sidebar_fixed_width_div_based
prompt  ......Page template 2306017030365310
 
begin
 
wwv_flow_api.create_template (
  p_id => 2306017030365310 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 22
 ,p_name => 'Two Level Tabs - Left Sidebar (fixed-width / DIV based)'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
' #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''
 ,p_box => 
'<div id="header">'||unistr('\000a')||
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <div id="navbar">'||unistr('\000a')||
'    <div class="app-user">#WELCOME_USER#</div>'||unistr('\000a')||
'    #NAVIGATION_BAR#'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div id="parent-tabs">'||unistr('\000a')||
'    <div class="tab-holder">#PARENT_TAB_CELLS#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<ul id="tabs">'||unistr('\000a')||
'#TAB_CELLS#'||unistr('\000a')||
'<li class="last"><span></span></li>'||unistr('\000a')||
'</ul'||
'>'||unistr('\000a')||
''||unistr('\000a')||
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>'||unistr('\000a')||
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'<div id="body">'||unistr('\000a')||
'  <div id="two-col-sb-left">'||unistr('\000a')||
'    <div id="left-sidebar">#REGION_POSITION_02#</div>'||unistr('\000a')||
'    <div id="main-sb-left">'||unistr('\000a')||
'      #BOX_BODY##REGION_POSITION_03#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''
 ,p_footer_template => 
'<div id="footer"><div class="content">'||unistr('\000a')||
'<div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'<div class="app-version">#APP_VERSION#</div>'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'  #REGION_POSITION_05#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_non_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_top_current_tab => '<div class="current"><div>'||unistr('\000a')||
'#TAB_LABEL##TAB_INLINE_EDIT#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_top_non_curr_tab => '<div class="noncurrent"><div>'||unistr('\000a')||
'<a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 18
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_left_and_right_sidebar_fixed_width_div_left_and_optional_table_based_right
prompt  ......Page template 2306110771365314
 
begin
 
wwv_flow_api.create_template (
  p_id => 2306110771365314 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 22
 ,p_name => 'Two Level Tabs - Left and Right Sidebar (fixed-width / DIV left and optional table-based right)'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
' #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''
 ,p_box => 
'<div id="header">'||unistr('\000a')||
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <div id="navbar">'||unistr('\000a')||
'    <div class="app-user">#WELCOME_USER#</div>'||unistr('\000a')||
'    #NAVIGATION_BAR#'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div id="parent-tabs">'||unistr('\000a')||
'    <div class="tab-holder">#PARENT_TAB_CELLS#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<ul id="tabs">'||unistr('\000a')||
'#TAB_CELLS#'||unistr('\000a')||
'<li class="last"><span></span></li>'||unistr('\000a')||
'</ul'||
'>'||unistr('\000a')||
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>'||unistr('\000a')||
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'<div id="body">'||unistr('\000a')||
'  <div id="three-col">'||unistr('\000a')||
'    <div id="left-sidebar">#REGION_POSITION_02#</div>'||unistr('\000a')||
'    <div id="two-col-tbl">'||unistr('\000a')||
'      <table class="tbl-body" cellspacing="0" cellpadding="0" border="0" summary="">'||unistr('\000a')||
'        <tbody>'||unistr('\000a')||
'          <tr>'||unistr('\000a')||
'            '||
'<td class="tbl-main" width="100%">#BOX_BODY#</td>'||unistr('\000a')||
'            <td class="tbl-sidebar">#REGION_POSITION_03#</td>     '||unistr('\000a')||
'          </tr>'||unistr('\000a')||
'        </tbody>'||unistr('\000a')||
'      </table>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''
 ,p_footer_template => 
'<div id="footer"><div class="content">'||unistr('\000a')||
'<div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'<div class="app-version">#APP_VERSION#</div>'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'  #REGION_POSITION_05#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_non_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_top_current_tab => '<div class="current"><div>'||unistr('\000a')||
'#TAB_LABEL##TAB_INLINE_EDIT#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_top_non_curr_tab => '<div class="noncurrent"><div>'||unistr('\000a')||
'<a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 18
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_right_sidebar_fixed_width_div_based
prompt  ......Page template 2306208485365314
 
begin
 
wwv_flow_api.create_template (
  p_id => 2306208485365314 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 22
 ,p_name => 'Two Level Tabs - Right Sidebar (fixed-width / DIV based)'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
' #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''
 ,p_box => 
'<div id="header">'||unistr('\000a')||
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <div id="navbar">'||unistr('\000a')||
'    <div class="app-user">#WELCOME_USER#</div>'||unistr('\000a')||
'    #NAVIGATION_BAR#'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div id="parent-tabs">'||unistr('\000a')||
'    <div class="tab-holder">#PARENT_TAB_CELLS#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<ul id="tabs">'||unistr('\000a')||
'#TAB_CELLS#'||unistr('\000a')||
'<li class="last"><span></span></li>'||unistr('\000a')||
'</ul'||
'>'||unistr('\000a')||
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>'||unistr('\000a')||
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'<div id="body">'||unistr('\000a')||
'  <div id="two-col">'||unistr('\000a')||
'    <div id="sidebar">#REGION_POSITION_03#</div>     '||unistr('\000a')||
'    <div id="main">#REGION_POSITION_02##BOX_BODY#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''
 ,p_footer_template => 
'<div id="footer"><div class="content">'||unistr('\000a')||
'<div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'<div class="app-version">#APP_VERSION#</div>'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'  #REGION_POSITION_05#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_non_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_top_current_tab => '<div class="current"><div>'||unistr('\000a')||
'#TAB_LABEL##TAB_INLINE_EDIT#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_top_non_curr_tab => '<div class="noncurrent"><div>'||unistr('\000a')||
'<a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 2
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_right_sidebar_optional_table_based
prompt  ......Page template 2306318012365320
 
begin
 
wwv_flow_api.create_template (
  p_id => 2306318012365320 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 22
 ,p_name => 'Two Level Tabs - Right Sidebar (optional / table-based)'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
' #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''
 ,p_box => 
'<div id="header">'||unistr('\000a')||
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <div id="navbar">'||unistr('\000a')||
'    <div class="app-user">#WELCOME_USER#</div>'||unistr('\000a')||
'    #NAVIGATION_BAR#'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div id="parent-tabs">'||unistr('\000a')||
'    <div class="tab-holder">#PARENT_TAB_CELLS#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<ul id="tabs">'||unistr('\000a')||
'#TAB_CELLS#'||unistr('\000a')||
'<li class="last"><span></span></li>'||unistr('\000a')||
'</ul'||
'>'||unistr('\000a')||
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>'||unistr('\000a')||
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'<div id="body">'||unistr('\000a')||
'  <table class="tbl-body" cellspacing="0" cellpadding="0" border="0" summary="">'||unistr('\000a')||
'    <tbody>'||unistr('\000a')||
'      <tr>'||unistr('\000a')||
'        <td class="tbl-main" width="100%">#REGION_POSITION_02##BOX_BODY#</td>'||unistr('\000a')||
'        <td class="tbl-sidebar">#REGION_POSITION_0'||
'3#</td>     '||unistr('\000a')||
'      </tr>'||unistr('\000a')||
'    </tbody>'||unistr('\000a')||
'  </table>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<div id="footer"><div class="content">'||unistr('\000a')||
'<div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'<div class="app-version">#APP_VERSION#</div>'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'  #REGION_POSITION_05#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_non_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_top_current_tab => '<div class="current"><div>'||unistr('\000a')||
'#TAB_LABEL##TAB_INLINE_EDIT#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_top_non_curr_tab => '<div class="noncurrent"><div>'||unistr('\000a')||
'<a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 2
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

prompt  ...button templates
--
--application/shared_components/user_interface/templates/button/button
prompt  ......Button Template 2312915180365529
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 2312915180365529 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button'
 ,p_template => 
'<button value="#LABEL#" onclick="#JAVASCRIPT#" class="button-default" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">'||unistr('\000a')||
'  <span>#LABEL#</span>'||unistr('\000a')||
'</button>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 22
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/hot_button_black
prompt  ......Button Template 2313016553365542
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 2313016553365542 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Hot Button (Black)'
 ,p_template => 
'<button value="#LABEL#" onclick="#JAVASCRIPT#" class="button-alt5" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">'||unistr('\000a')||
'  <span>#LABEL#</span>'||unistr('\000a')||
'</button>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 4
 ,p_theme_id => 22
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/hot_button_blue
prompt  ......Button Template 2313114606365543
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 2313114606365543 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Hot Button (Blue)'
 ,p_template => 
'<button value="#LABEL#" onclick="#JAVASCRIPT#" class="button-alt1" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">'||unistr('\000a')||
'  <span>#LABEL#</span>'||unistr('\000a')||
'</button>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 4
 ,p_theme_id => 22
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/hot_button_yellow
prompt  ......Button Template 2313226835365543
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 2313226835365543 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Hot Button (Yellow)'
 ,p_template => 
'<button value="#LABEL#" onclick="#JAVASCRIPT#" class="button-alt4" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">'||unistr('\000a')||
'  <span>#LABEL#</span>'||unistr('\000a')||
'</button>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 4
 ,p_theme_id => 22
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/small_button
prompt  ......Button Template 2313323716365543
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 2313323716365543 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Small Button'
 ,p_template => 
'<button value="#LABEL#" onclick="#JAVASCRIPT#" class="button-alt2" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">'||unistr('\000a')||
'  <span>#LABEL#</span>'||unistr('\000a')||
'</button>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 5
 ,p_template_comment => 'XP Square FFFFFF'
 ,p_theme_id => 22
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/small_hot_button_blue
prompt  ......Button Template 2313427316365543
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 2313427316365543 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Small Hot Button (Blue)'
 ,p_template => 
'<button value="#LABEL#" onclick="#JAVASCRIPT#" class="button-alt3" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">'||unistr('\000a')||
'  <span>#LABEL#</span>'||unistr('\000a')||
'</button>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 2
 ,p_template_comment => 'Standard Button'
 ,p_theme_id => 22
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/small_hot_button_yellow
prompt  ......Button Template 2313516804365543
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 2313516804365543 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Small Hot Button (Yellow)'
 ,p_template => 
'<button value="#LABEL#" onclick="#JAVASCRIPT#" class="button-alt6" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">'||unistr('\000a')||
'  <span>#LABEL#</span>'||unistr('\000a')||
'</button>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 2
 ,p_template_comment => 'Standard Button'
 ,p_theme_id => 22
  );
null;
 
end;
/

---------------------------------------
prompt  ...region templates
--
--application/shared_components/user_interface/templates/region/blank_region
prompt  ......region template 2306403621365326
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2306403621365326 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="blank-region">'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Blank Region'
 ,p_theme_id => 22
 ,p_theme_class_id => 7
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/borderless_region
prompt  ......region template 2306517846365368
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2306517846365368 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="borderless-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="bl-top">'||unistr('\000a')||
'    <div class="bl-title">#TITLE#</div>'||unistr('\000a')||
'    <div class="bl-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="bl-body">#BODY#</div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div class="clear"></div>'
 ,p_page_plug_template_name => 'Borderless Region'
 ,p_theme_id => 22
 ,p_theme_class_id => 7
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Use this region template when you want to contain content without a border.'||unistr('\000a')||
''||unistr('\000a')||
'TITLE=YES'||unistr('\000a')||
'BUTTONS=YES'||unistr('\000a')||
'100% WIDTH=NO'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/borderless_region_no_title
prompt  ......region template 2306616072365368
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2306616072365368 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="borderless-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="bl-top">'||unistr('\000a')||
'    '||unistr('\000a')||
'    <div class="bl-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="bl-body">#BODY#</div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div class="clear"></div>'
 ,p_page_plug_template_name => 'Borderless Region - No Title'
 ,p_theme_id => 22
 ,p_theme_class_id => 7
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Use this region template when you want to contain content without a border.'||unistr('\000a')||
''||unistr('\000a')||
'TITLE=YES'||unistr('\000a')||
'BUTTONS=YES'||unistr('\000a')||
'100% WIDTH=NO'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/bracketed_region
prompt  ......region template 2306728178365368
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2306728178365368 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="bracketed-region brackets" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="bk-top">'||unistr('\000a')||
'    <div class="bk-top-r">'||unistr('\000a')||
'      <div class="bk-title">#TITLE#</div>'||unistr('\000a')||
'      <div class="bk-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="bk-body">#BODY#</div>'||unistr('\000a')||
'  <div class="bk-bottom">'||unistr('\000a')||
'    <div class="bk-bott'||
'om-r">&nbsp;</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Bracketed Region'
 ,p_theme_id => 22
 ,p_theme_class_id => 18
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Use this region template when you want to contain content with a bracket UI.'||unistr('\000a')||
''||unistr('\000a')||
'TITLE=YES'||unistr('\000a')||
'BUTTONS=YES'||unistr('\000a')||
'100% WIDTH=NO'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/breadcrumb_region
prompt  ......region template 2306805403365368
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2306805403365368 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="breadcrumb-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>'
 ,p_page_plug_template_name => 'Breadcrumb Region'
 ,p_theme_id => 22
 ,p_theme_class_id => 6
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Use this region template to contain breadcrumb menus.  Breadcrumb menus are implemented using breadcrumbs.  Breadcrumb menus are designed to displayed in #REGION_POSITION_01#'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_with_title
prompt  ......region template 2306929236365368
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2306929236365368 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region-blank" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="rc-gray-top">'||unistr('\000a')||
'    <div class="rc-gray-top-r"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="rc-body">'||unistr('\000a')||
'    <div class="rc-body-r">'||unistr('\000a')||
'      <div class="rc-content-main">'||unistr('\000a')||
'        <div class="rc-left">'||unistr('\000a')||
'          <h3>#TITLE#</h3>'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'        <div class="rc-right">'||unistr('\000a')||
'#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CR'||
'EATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'        <div class="clear"></div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="rc-bottom">'||unistr('\000a')||
'    <div class="rc-bottom-r"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Button Region with Title'
 ,p_theme_id => 22
 ,p_theme_class_id => 4
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_without_title
prompt  ......region template 2307010760365368
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2307010760365368 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region-blank" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="rc-gray-top">'||unistr('\000a')||
'    <div class="rc-gray-top-r"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="rc-body">'||unistr('\000a')||
'    <div class="rc-body-r">'||unistr('\000a')||
'      <div class="rc-content-main">'||unistr('\000a')||
'        <div class="rc-left">'||unistr('\000a')||
'          #BODY#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'        <div class="rc-right">'||unistr('\000a')||
'#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREA'||
'TE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'        <div class="clear"></div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="rc-bottom">'||unistr('\000a')||
'    <div class="rc-bottom-r"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Button Region without Title'
 ,p_theme_id => 22
 ,p_theme_class_id => 17
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/centered_tab_set_region
prompt  ......region template 2307122037365368
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2307122037365368 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="tSC">'||unistr('\000a')||
'  #BODY#'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div class="tSF">'||unistr('\000a')||
'  <div class="tSFO">'||unistr('\000a')||
'    <div class="tSFI">'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''
 ,p_page_plug_template_name => 'Centered Tab Set Region'
 ,p_theme_id => 22
 ,p_theme_class_id => 21
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_list
prompt  ......region template 2307218410365368
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2307218410365368 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="rc-gray-top"><div class="rc-gray-top-r">'||unistr('\000a')||
'    <div class="rc-title">#TITLE#</div>'||unistr('\000a')||
'    <div class="rc-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'  </div></div>'||unistr('\000a')||
'  <div class="rc-body"><div class="rc-body-r"><div class="rc-content-main">'||unistr('\000a')||
'     <div class="'||
'rc-image"><img src="#IMAGE_PREFIX#themes/theme_22/images/report_icon.png" alt="" /></div>'||unistr('\000a')||
'      <div class="rc-content">#BODY#</div>'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Chart List'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 22
 ,p_theme_class_id => 29
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_region
prompt  ......region template 2307327633365368
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2307327633365368 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="rc-gray-top"><div class="rc-gray-top-r">'||unistr('\000a')||
'    <div class="rc-title">#TITLE#</div>'||unistr('\000a')||
'  </div></div>'||unistr('\000a')||
'  <div class="rc-body"><div class="rc-body-r">'||unistr('\000a')||
'<div class="rc-content-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'<div class="rc-content-main">#BODY#<div cl'||
'ass="clear"></div></div></div></div>'||unistr('\000a')||
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Chart Region'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 22
 ,p_theme_class_id => 30
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region
prompt  ......region template 2307410395365368
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2307410395365368 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="rc-gray-top"><div class="rc-gray-top-r">'||unistr('\000a')||
'    <div class="rc-title">#TITLE#</div>'||unistr('\000a')||
'  </div></div>'||unistr('\000a')||
'  <div class="rc-body"><div class="rc-body-r">'||unistr('\000a')||
'<div class="rc-content-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'<div class="rc-content-main">'||unistr('\000a')||
'#BODY#<div c'||
'lass="clear"></div></div></div></div>'||unistr('\000a')||
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Form Region'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 22
 ,p_theme_class_id => 8
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/hide_and_show_region
prompt  ......region template 2307510092365371
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2307510092365371 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="hide-show-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="hide-show-top">'||unistr('\000a')||
'    <div class="hide-show-title"><a href="javascript:hideShow(''region#REGION_SEQUENCE_ID#'',''shIMG#REGION_SEQUENCE_ID#'',''#IMAGE_PREFIX#themes/theme_22/images/right_arrow.png'',''#IMAGE_PREFIX#themes/theme_22/images/down_arrow.png'');" class="t1HideandShowRegionLink"><img src="#IMAGE_PREFIX#themes/t'||
'heme_22/images/right_arrow.png" '||unistr('\000a')||
'  id="shIMG#REGION_SEQUENCE_ID#" alt="" /></a> #TITLE#</div>'||unistr('\000a')||
'    <div class="hide-show-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'<div class="hide" id="region#REGION_SEQUENCE_ID#" style="float:left;">#BODY#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Hide and Show Region'
 ,p_theme_id => 22
 ,p_theme_class_id => 1
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Gray Head, white body'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region
prompt  ......region template 2307631284365371
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2307631284365371 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="navigation-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'    <h3>#TITLE#</h3>'||unistr('\000a')||
'  <div>'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Navigation Region'
 ,p_theme_id => 22
 ,p_theme_class_id => 5
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region_alternative_1
prompt  ......region template 2307700337365371
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2307700337365371 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="navigation-region-alt" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>'
 ,p_page_plug_template_name => 'Navigation Region, Alternative 1'
 ,p_theme_id => 22
 ,p_theme_class_id => 16
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/nested_region
prompt  ......region template 2307807158365371
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2307807158365371 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region-nested" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'	<div class="nr-top">'||unistr('\000a')||
'		<div class="nr-top-r">'||unistr('\000a')||
'    <div class="nr-title">#TITLE#</div>'||unistr('\000a')||
'    <div class="nr-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'		</div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div class="nr-body">'||unistr('\000a')||
'		<div class="nr-content-main">'||unistr('\000a')||
'			#BODY#'||unistr('\000a')||
'			<div class="clear"></div'||
'>'||unistr('\000a')||
'		</div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Nested Region'
 ,p_theme_id => 22
 ,p_theme_class_id => 7
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Use this region template when you want to contain content without a border.'||unistr('\000a')||
''||unistr('\000a')||
'TITLE=YES'||unistr('\000a')||
'BUTTONS=YES'||unistr('\000a')||
'100% WIDTH=NO'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_buttons_and_titles
prompt  ......region template 2307931192365371
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2307931192365371 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="borderless-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="bl-body">#BODY#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Region without Buttons and Titles'
 ,p_theme_id => 22
 ,p_theme_class_id => 19
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_title
prompt  ......region template 2308016655365371
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2308016655365371 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="borderless-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="bl-top">'||unistr('\000a')||
'    <div class="bl-title">&nbsp;</div>'||unistr('\000a')||
'    <div class="bl-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="bl-body">#BODY#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Region without Title'
 ,p_theme_id => 22
 ,p_theme_class_id => 11
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_filter_single_row
prompt  ......region template 2308116504365371
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2308116504365371 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="apex_finderbar" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tbody>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="apex_finderbar_left_top" valign="top"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8" alt=""  class="spacer" alt="" /></td>'||unistr('\000a')||
'<td class="apex_finderbar_middle" rowspan="3" valign="middle"><img src="#IMAGE_PREFIX#htmldb/builder/builder_f'||
'ind.png" /></td>'||unistr('\000a')||
'<td class="apex_finderbar_middle" rowspan="3" valign="middle" style="">#BODY#</td>'||unistr('\000a')||
'<td class="apex_finderbar_left" rowspan="3" width="10"><br /></td>'||unistr('\000a')||
'<td class="apex_finderbar_buttons" rowspan="3" valign="middle" nowrap="nowrap"><span class="apex_close">#CLOSE#</span><span>#EDIT##CHANGE##DELETE##CREATE##CREATE2##COPY##PREVIOUS##NEXT##EXPAND##HELP#</span></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="'||
'apex_finderbar_left_middle"><br /></td></tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="apex_finderbar_left_bottom" valign="bottom"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8"  class="spacer" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Report Filter - Single Row'
 ,p_theme_id => 22
 ,p_theme_class_id => 31
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_list
prompt  ......region template 2308216703365371
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2308216703365371 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region-alt" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="rc-gray-top"><div class="rc-gray-top-r">'||unistr('\000a')||
'    <div class="rc-title">#TITLE#</div>'||unistr('\000a')||
'  </div></div>'||unistr('\000a')||
'  <div class="rc-body"><div class="rc-body-r">'||unistr('\000a')||
'<div class="rc-content-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'    <div class="rc-content-main">'||unistr('\000a')||
'    '||
'#BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div></div>'||unistr('\000a')||
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Report List'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 22
 ,p_theme_class_id => 29
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region
prompt  ......region template 2308330636365382
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2308330636365382 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="rc-gray-top"><div class="rc-gray-top-r">'||unistr('\000a')||
'    <div class="rc-title">#TITLE#</div>'||unistr('\000a')||
'  </div></div>'||unistr('\000a')||
'  <div class="rc-body"><div class="rc-body-r">'||unistr('\000a')||
'<div class="rc-content-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'<div class="rc-content-main">#BODY#<div cl'||
'ass="clear"></div></div></div></div>'||unistr('\000a')||
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>'||unistr('\000a')||
'</div> '
 ,p_page_plug_template_name => 'Reports Region'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 22
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_100_width
prompt  ......region template 2308426506365384
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2308426506365384 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region float-left-100pct" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="rc-gray-top"><div class="rc-gray-top-r">'||unistr('\000a')||
'    <div class="rc-title">#TITLE#</div>'||unistr('\000a')||
'  </div></div>'||unistr('\000a')||
'  <div class="rc-body"><div class="rc-body-r">'||unistr('\000a')||
'<div class="rc-content-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'<div class="rc-content-m'||
'ain">#BODY#<div class="clear"></div></div></div></div>'||unistr('\000a')||
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''
 ,p_page_plug_template_name => 'Reports Region 100% Width'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 22
 ,p_theme_class_id => 13
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_no_title
prompt  ......region template 2308516448365390
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2308516448365390 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region-blank-white" id="#REGION_STATIC_ID#"  #REGION_ATTRIBUTES#>'||unistr('\000a')||
'	<div class="rc-gray-top">'||unistr('\000a')||
'		<div class="rc-gray-top-r"></div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div class="rc-body">'||unistr('\000a')||
'		<div class="rc-body-r">'||unistr('\000a')||
'			<div class="rc-content-main">'||unistr('\000a')||
'				#BODY#'||unistr('\000a')||
'				<div class="clear"></div>'||unistr('\000a')||
'			</div>'||unistr('\000a')||
'			<div class="rc-content-buttons">'||unistr('\000a')||
'				#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##'||
'EXPAND##COPY##HELP#'||unistr('\000a')||
'			</div>'||unistr('\000a')||
'			<div class="clear"></div>'||unistr('\000a')||
'		</div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div class="rc-bottom">'||unistr('\000a')||
'		<div class="rc-bottom-r"></div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Reports Region No Title'
 ,p_theme_id => 22
 ,p_theme_class_id => 9
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_no_title_alternative_1
prompt  ......region template 2308605493365390
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2308605493365390 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region-blank-alt" id="#REGION_STATIC_ID#"  #REGION_ATTRIBUTES#>'||unistr('\000a')||
'	<div class="rc-gray-top">'||unistr('\000a')||
'		<div class="rc-gray-top-r"></div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div class="rc-body">'||unistr('\000a')||
'		<div class="rc-body-r">'||unistr('\000a')||
'			<div class="rc-content-main">'||unistr('\000a')||
'				#BODY#'||unistr('\000a')||
'				<div class="clear"></div>'||unistr('\000a')||
'			</div>'||unistr('\000a')||
'			<div class="rc-content-buttons">'||unistr('\000a')||
'				#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EX'||
'PAND##COPY##HELP#'||unistr('\000a')||
'			</div>'||unistr('\000a')||
'			<div class="clear"></div>'||unistr('\000a')||
'		</div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div class="rc-bottom">'||unistr('\000a')||
'		<div class="rc-bottom-r"></div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Reports Region No Title, Alternative 1'
 ,p_theme_id => 22
 ,p_theme_class_id => 10
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_alternative_1
prompt  ......region template 2308700748365390
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2308700748365390 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region-alt" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="rc-gray-top"><div class="rc-gray-top-r">'||unistr('\000a')||
'    <div class="rc-title">#TITLE#</div>'||unistr('\000a')||
'  </div></div>'||unistr('\000a')||
'  <div class="rc-body"><div class="rc-body-r">'||unistr('\000a')||
'<div class="rc-content-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'<div class="rc-content-main">#BODY#<di'||
'v class="clear"></div>'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Reports Region, Alternative 1'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 22
 ,p_theme_class_id => 10
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region
prompt  ......region template 2308809599365390
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2308809599365390 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="sidebar-region">'||unistr('\000a')||
'<div class="rounded-corner-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="rc-gray-top"><div class="rc-gray-top-r">'||unistr('\000a')||
'    <div class="rc-title">#TITLE#</div>'||unistr('\000a')||
'  </div></div>'||unistr('\000a')||
'  <div class="rc-body"><div class="rc-body-r">'||unistr('\000a')||
'<div class="rc-content-main">#BODY#<div class="clear"></div></div></div></div>'||unistr('\000a')||
'  <div class="rc-bottom"><div class="rc-bottom-r"></div'||
'></div>'||unistr('\000a')||
'</div> '||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Sidebar Region'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 22
 ,p_theme_class_id => 2
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => '<table border="0" cellpadding="0" cellspacing="0">'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td rowspan="2" valign="top" width="4" bgcolor="#FF0000"><img src="#IMAGE_PREFIX#tl_img.gif" border="0" width="4" height="18" alt="" /></td>'||unistr('\000a')||
'          <td bgcolor="#000000" height="1"><img src="#IMAGE_PREFIX#stretch.gif" width="142" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'          <td rowspan="2" valign="top" width="4" bgcolor="#FF0000"><img src="#IMAGE_PREFIX#tr_img.gif" border="0" width="4" height="18" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td bgcolor="#FF0000" height="16">'||unistr('\000a')||
'            <table border="0" cellpadding="0" cellspacing="0" width="100%">'||unistr('\000a')||
'              <tr>'||unistr('\000a')||
'                <td align=middle valign="top">'||unistr('\000a')||
'                  <div align="center">'||unistr('\000a')||
'                     <font color="#ffffff" face="Arial, Helvetica, sans-serif" size="1">'||unistr('\000a')||
'                      <b>#TITLE# </b></font></div>'||unistr('\000a')||
'                </td>'||unistr('\000a')||
'              </tr>'||unistr('\000a')||
'            </table>'||unistr('\000a')||
'          </td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0">'||unistr('\000a')||
'   <tr>'||unistr('\000a')||
'   <td bgcolor="#000000" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'   <td valign="top" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="146" height="1" border="0" alt="" /><br />'||unistr('\000a')||
'            <table border="0" cellpadding="1" cellspacing="0" width="146" summary="">'||unistr('\000a')||
'              <tr>'||unistr('\000a')||
'                <td colspan="2">'||unistr('\000a')||
'                  <table border="0" cellpadding="2" cellspacing="0" width="124" summary="">'||unistr('\000a')||
'                    <tr>'||unistr('\000a')||
'                      <td>&nbsp;</td>'||unistr('\000a')||
'                      <td valign="top" width="106">'||unistr('\000a')||
'                        <P><FONT face="arial, helvetica" size="1">'||unistr('\000a')||
'                            #BODY#'||unistr('\000a')||
'                           </font>'||unistr('\000a')||
'                        </P>'||unistr('\000a')||
'                      </td>'||unistr('\000a')||
'                    </tr>'||unistr('\000a')||
'                  </table>'||unistr('\000a')||
'            </table>'||unistr('\000a')||
'          </td>'||unistr('\000a')||
'          <td bgcolor="#000000" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'          <td bgcolor="#9a9c9a" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'          <td bgcolor="#b3b4b3" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'      </table>'||unistr('\000a')||
'      <table border="0" cellpadding="0" cellspacing="0">'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td rowspan="4" valign="top" width="4"><img src="#IMAGE_PREFIX#bl_img.gif" border="0" width="4" height="6" alt="" /></td>'||unistr('\000a')||
'          <td bgcolor="#ffffff" height="2"><img src="#IMAGE_PREFIX#stretch.gif" width="142" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'          <td rowspan="4" valign="top" width="4"><img src="#IMAGE_PREFIX#br_img.gif" border="0" width="4" height="6" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td bgcolor="#000000" width="1"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td bgcolor="#9a9c9a" width="1"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td bgcolor="#b3b4b3" width="1" height="2"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
''
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region_alternative_1
prompt  ......region template 2308908314365392
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2308908314365392 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="sidebar-region">'||unistr('\000a')||
'<div class="rounded-corner-region-alt" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="rc-gray-top"><div class="rc-gray-top-r">'||unistr('\000a')||
'    <div class="rc-title">#TITLE#</div>'||unistr('\000a')||
'  </div></div>'||unistr('\000a')||
'  <div class="rc-body"><div class="rc-body-r">'||unistr('\000a')||
'<div class="rc-content-main">#BODY#<div class="clear"></div></div></div></div>'||unistr('\000a')||
'  <div class="rc-bottom"><div class="rc-bottom-r"><'||
'/div></div>'||unistr('\000a')||
'</div> '||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Sidebar Region, Alternative 1'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 22
 ,p_theme_class_id => 3
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region_bordered
prompt  ......region template 2309010717365431
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2309010717365431 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region-blank-white sidebar-alt2" id="#REGION_STATIC_ID#"  #REGION_ATTRIBUTES#>'||unistr('\000a')||
'	<div class="rc-gray-top">'||unistr('\000a')||
'		<div class="rc-gray-top-r"></div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div class="rc-body">'||unistr('\000a')||
'		<div class="rc-body-r">'||unistr('\000a')||
'			<div class="rc-content-main">'||unistr('\000a')||
'				#BODY#'||unistr('\000a')||
'				<div class="clear"></div>'||unistr('\000a')||
'			</div>'||unistr('\000a')||
'			<div class="rc-content-buttons">'||unistr('\000a')||
'				#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREA'||
'TE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'			</div>'||unistr('\000a')||
'			<div class="clear"></div>'||unistr('\000a')||
'		</div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div class="rc-bottom">'||unistr('\000a')||
'		<div class="rc-bottom-r"></div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Sidebar Region, Bordered'
 ,p_theme_id => 22
 ,p_theme_class_id => 3
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region_bordered_alternative
prompt  ......region template 2309106053365431
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2309106053365431 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region-blank-alt sidebar-alt2" id="#REGION_STATIC_ID#"  #REGION_ATTRIBUTES#>'||unistr('\000a')||
'	<div class="rc-gray-top">'||unistr('\000a')||
'		<div class="rc-gray-top-r"></div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div class="rc-body">'||unistr('\000a')||
'		<div class="rc-body-r">'||unistr('\000a')||
'			<div class="rc-content-main">'||unistr('\000a')||
'				#BODY#'||unistr('\000a')||
'				<div class="clear"></div>'||unistr('\000a')||
'			</div>'||unistr('\000a')||
'			<div class="rc-content-buttons">'||unistr('\000a')||
'				#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE'||
'##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'			</div>'||unistr('\000a')||
'			<div class="clear"></div>'||unistr('\000a')||
'		</div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div class="rc-bottom">'||unistr('\000a')||
'		<div class="rc-bottom-r"></div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Sidebar Region, Bordered Alternative'
 ,p_theme_id => 22
 ,p_theme_class_id => 3
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region
prompt  ......region template 2309201180365431
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2309201180365431 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region-wizard" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="rc-gray-top"><div class="rc-gray-top-r">'||unistr('\000a')||
'    <div class="rc-title">#TITLE#</div>'||unistr('\000a')||
'<div class="rc-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'  </div></div>'||unistr('\000a')||
'  <div class="rc-body"><div class="rc-body-r">'||unistr('\000a')||
'<div class="rc-content-main">#BODY#<div cla'||
'ss="clear"></div></div></div></div>'||unistr('\000a')||
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Wizard Region'
 ,p_theme_id => 22
 ,p_theme_class_id => 12
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region_with_icon
prompt  ......region template 2309307529365431
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2309307529365431 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region-wizard" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="rc-gray-top"><div class="rc-gray-top-r">'||unistr('\000a')||
'    <div class="rc-title">#TITLE#</div>'||unistr('\000a')||
'<div class="rc-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'  </div></div>'||unistr('\000a')||
'  <div class="rc-body"><div class="rc-body-r">'||unistr('\000a')||
'<div class="rc-content-main">#BODY#<div cla'||
'ss="clear"></div></div></div></div>'||unistr('\000a')||
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Wizard Region with Icon'
 ,p_theme_id => 22
 ,p_theme_class_id => 20
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

prompt  ...List Templates
--
--application/shared_components/user_interface/templates/list/button_list
prompt  ......list template 2310424075365479
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<button value="#TEXT#" onclick="javascript:location.href=''#LINK#''" class="button-alt1" type="button">'||unistr('\000a')||
'  <span>#TEXT#</span>'||unistr('\000a')||
'</button>';

t2:=t2||'<button value="#TEXT#" onclick="javascript:location.href=''#LINK#''" class="button-default" type="button">'||unistr('\000a')||
'  <span>#TEXT#</span>'||unistr('\000a')||
'</button>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2310424075365479 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Button List',
  p_theme_id  => 22,
  p_theme_class_id => 6,
  p_list_template_before_rows=>'<div class="button-list">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/centered_tab_set
prompt  ......list template 2310510710365501
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'          <li class="#LIST_STATUS#">'||unistr('\000a')||
'            <a href="#LINK#"><span>#TEXT#</span></a>'||unistr('\000a')||
'          </li>';

t2:=t2||'          <li class="#LIST_STATUS#">'||unistr('\000a')||
'            <a href="#LINK#"><span>#TEXT#</span></a>'||unistr('\000a')||
'          </li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2310510710365501 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Centered Tab Set',
  p_theme_id  => 22,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<div class="tS">'||unistr('\000a')||
'  <div class="tSO">'||unistr('\000a')||
'    <div class="tSI">'||unistr('\000a')||
'      <div class="tSU">'||unistr('\000a')||
'        <ul>',
  p_list_template_after_rows=>'         </ul>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/dhtml_tree
prompt  ......list template 2310618725365501
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>2310618725365501 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Tree',
  p_theme_id  => 22,
  p_theme_class_id => 23,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/hierarchical_expanding
prompt  ......list template 2310701797365501
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif"  align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>2310701797365501 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Hierarchical Expanding',
  p_theme_id  => 22,
  p_theme_class_id => 22,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_images_with_label_list
prompt  ......list template 2310826048365501
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="list-item-current">'||unistr('\000a')||
'  <div class="list-item-image"><a href="#LINK#" class="current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" / ></a></div>'||unistr('\000a')||
'  <div class="list-item-label"><a href="#LINK#" class="current">#TEXT#</a></div>'||unistr('\000a')||
'</div>';

t2:=t2||'<div class="list-item">'||unistr('\000a')||
'  <div class="list-item-image"><a href="#LINK#" class="current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" / ></a></div>'||unistr('\000a')||
'  <div class="list-item-label"><a href="#LINK#" class="current">#TEXT#</a></div>'||unistr('\000a')||
'</div>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2310826048365501 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Images with Label List',
  p_theme_id  => 22,
  p_theme_class_id => 4,
  p_list_template_before_rows=>'<div class="horizontal-images-list">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_links_list
prompt  ......list template 2310915610365501
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="current">#TEXT#</a>';

t2:=t2||'<a href="#LINK#">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2310915610365501 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Links List',
  p_theme_id  => 22,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<div class="horizontal-links-list">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_tabs_rounded_list
prompt  ......list template 2311005185365503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="#LIST_STATUS#"><a href="#LINK#"><span>#TEXT#</span></a></li>';

t2:=t2||'<li class="#LIST_STATUS#"><a href="#LINK#"><span>#TEXT#</span></a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2311005185365503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Tabs Rounded List',
  p_theme_id  => 22,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<div class="sHTabs">'||unistr('\000a')||
'	<div class="sHTabsInner">'||unistr('\000a')||
'		<ul>',
  p_list_template_after_rows=>'		</ul>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_tabs_rounded_list_full_width
prompt  ......list template 2311125120365503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="#LIST_STATUS#"><a href="#LINK#"><span>#TEXT#</span></a></li>';

t2:=t2||'<li class="#LIST_STATUS#"><a href="#LINK#"><span>#TEXT#</span></a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2311125120365503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Tabs Rounded List (Full Width)',
  p_theme_id  => 22,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<div class="sHFWTabs">'||unistr('\000a')||
'<div class="sHTabs">'||unistr('\000a')||
'	<div class="sHTabsInner">'||unistr('\000a')||
'		<ul>',
  p_list_template_after_rows=>'			<li class="last"></li>'||unistr('\000a')||
'		</ul>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/page_level_tabs_list
prompt  ......list template 2311210386365503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="#LIST_STATUS#"><a href="#LINK#"><span></span>#TEXT#</a></li>';

t2:=t2||'<li class="#LIST_STATUS#"><a href="#LINK#"><span></span>#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2311210386365503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Page Level Tabs List',
  p_theme_id  => 22,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<div class="sBTabs">'||unistr('\000a')||
'	<div class="sBTabsInner">'||unistr('\000a')||
'		<ul>',
  p_list_template_after_rows=>'			<li class="last"></li>'||unistr('\000a')||
'		</ul>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu
prompt  ......list template 2311331283365503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="dhtmlMenuSep2"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt="" class="dhtmlMenuSep2" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_22/images/menu-small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" />'||unistr('\000a')||
'</li>';

t6:=t6||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_22/images/menu-small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" / ></a></li>';

wwv_flow_api.create_list_template (
  p_id=>2311331283365503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu',
  p_theme_id  => 22,
  p_theme_class_id => 20,
  p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu_with_image
prompt  ......list template 2311414356365503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#" id="#LIST_ITEM_ID#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#  /></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#" id="#LIST_ITEM_ID#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#  "/></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#" id="#LIST_ITEM_ID#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#  /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt="" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom3(this,''S#LIST_ITEM_ID#'',''#LIST_ITEM_ID#'',false)" />'||unistr('\000a')||
'<a href="#LINK#" class="dhtmlBottom">#TEXT#</a>'||unistr('\000a')||
'</div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#" id="#LIST_ITEM_ID#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#  /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom3(this,''S#LIST_ITEM_ID#'',''#LIST_ITEM_ID#'',false)" />'||unistr('\000a')||
'<a href="#LINK#" class="dhtmlBottom">#TEXT#</a>'||unistr('\000a')||
'</div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''S#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''S#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>2311414356365503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu with Image',
  p_theme_id  => 22,
  p_theme_class_id => 21,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="S#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/tabbed_navigation_list
prompt  ......list template 2311502963365503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#"><span>#TEXT#</span></a></li>';

t2:=t2||'<li><a href="#LINK#"><span>#TEXT#</span></a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2311502963365503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tabbed Navigation List',
  p_theme_id  => 22,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<div class="sHorizontalTabs">'||unistr('\000a')||
'	<div class="sHorizontalTabsInner">'||unistr('\000a')||
'		<ul>',
  p_list_template_after_rows=>'		</ul>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_images_list
prompt  ......list template 2311611043365503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="list-item-current">'||unistr('\000a')||
'  <div class="list-item-image"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" / ></div>'||unistr('\000a')||
'  <div class="list-item-label"><a href="#LINK#" class="current">#TEXT#</a></div>'||unistr('\000a')||
'</div>';

t2:=t2||'<div class="list-item">'||unistr('\000a')||
'  <div class="list-item-image"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" / ></div>'||unistr('\000a')||
'  <div class="list-item-label"><a href="#LINK#" class="current">#TEXT#</a></div>'||unistr('\000a')||
'</div>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2311611043365503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List',
  p_theme_id  => 22,
  p_theme_class_id => 5,
  p_list_template_before_rows=>'<div class="vertical-images-list">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_ordered_list
prompt  ......list template 2311724472365503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="current">#TEXT#</li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2311724472365503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Ordered List',
  p_theme_id  => 22,
  p_theme_class_id => 2,
  p_list_template_before_rows=>'<ol class="vertical-ordered-List">',
  p_list_template_after_rows=>'</ol>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_sidebar_list
prompt  ......list template 2311815520365503
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2311815520365503 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Sidebar List',
  p_theme_id  => 22,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<div class="vertical-sidebar-list">'||unistr('\000a')||
'<ul>',
  p_list_template_after_rows=>'</ul>'||unistr('\000a')||
'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_with_bullets
prompt  ......list template 2311918637365504
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="current"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2311918637365504 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullets',
  p_theme_id  => 22,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="vertical-unordered-list-with-bullets-alt">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_with_bullets_alternative
prompt  ......list template 2312001598365504
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2312001598365504 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullets, Alternative',
  p_theme_id  => 22,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="vertical-unordered-list-with-bullets">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_without_bullets
prompt  ......list template 2312123316365504
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="current">#TEXT#</li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2312123316365504 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List without Bullets',
  p_theme_id  => 22,
  p_theme_class_id => 18,
  p_list_template_before_rows=>'<ul class="vertical-unordered-list-without-bullets">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/wizard_progress_list
prompt  ......list template 2312219084365504
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="current">#TEXT#</li>';

t2:=t2||'<li class="non-current">#TEXT#</li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2312219084365504 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List',
  p_theme_id  => 22,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<div class="wizard-progress-list" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#><ul>',
  p_list_template_after_rows=>'</ul></div>',
  p_between_items=>'<li class="progress-indicator">&nbsp;</li>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/wizard_progress_list_horizontal_train
prompt  ......list template 2312318724365506
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'    <li class="#LIST_STATUS#">'||unistr('\000a')||
'      <span>#TEXT#</span>'||unistr('\000a')||
'    </li>';

t2:=t2||'    <li class="#LIST_STATUS#">'||unistr('\000a')||
'      <span>#TEXT#</span>'||unistr('\000a')||
'    </li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2312318724365506 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List, Horizontal Train',
  p_theme_id  => 22,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<div class="sHorizontalProgressList">'||unistr('\000a')||
'  <ul>',
  p_list_template_after_rows=>'  </ul>'||unistr('\000a')||
'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ...report templates
--
--application/shared_components/user_interface/templates/report/borderless_report
prompt  ......report template 2309429873365439
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2309429873365439 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Borderless Report',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#<tr>'||unistr('\000a')||
'<td><table class="report-borderless" cellpadding="0" border="0" cellspacing="0" summary="">',
  p_row_template_after_rows =>'</table><div class="CSV">#EXTERNAL_LINK##CSV_LINK#</div></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="header"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>',
  p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>',
  p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 22,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2309429873365439 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/fixed_headers
prompt  ......report template 2309526508365460
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="data" #COLUMN_WIDTH#><p #COLUMN_WIDTH#>#COLUMN_VALUE#</p></td>';

c2:=c2||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="data-alt" #COLUMN_WIDTH#><p #COLUMN_WIDTH#>#COLUMN_VALUE#</p></td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2309526508365460 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Fixed Headers',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" class="report-holder">#TOP_PAGINATION#'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><div class="fixed-header-report"><table cellpadding="0" border="0" cellspacing="0" summary="">',
  p_row_template_after_rows =>'</tbody></table></div><div class="CSV">#EXTERNAL_LINK##CSV_LINK#</div></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<thead>'||unistr('\000a')||
'',
  p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="header" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>',
  p_after_column_heading=>'</thead>'||unistr('\000a')||
'<tbody>'||unistr('\000a')||
'',
  p_row_template_display_cond1=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'ODD_ROW_NUMBERS',
  p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>'||unistr('\000a')||
'',
  p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>',
  p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_mouse_over=>'#d8e4f0',
  p_row_style_checked=>'#d8e4f0',
  p_theme_id  => 22,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2309526508365460 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>'||unistr('\000a')||
'');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/horizontal_border
prompt  ......report template 2309608109365460
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2309608109365460 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Horizontal Border',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" class="horizontal-border" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><table cellpadding="0" cellspacing="0" border="0" class="report-standard" summary="">',
  p_row_template_after_rows =>'</table><div class="CSV">#EXTERNAL_LINK##CSV_LINK#</div></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>',
  p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>',
  p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ccc',
  p_theme_id  => 22,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2309608109365460 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/one_column_unordered_list
prompt  ......report template 2309721116365460
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>#COLUMN_VALUE#</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2309721116365460 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'One Column Unordered List',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||unistr('\000a')||
'#TOP_PAGINATION#'||unistr('\000a')||
'<tr><td><ul class="t1OneColumnUnorderedList">',
  p_row_template_after_rows =>'</ul><div class="t1CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'NOT_CONDITIONAL',
  p_row_template_display_cond2=>'NOT_CONDITIONAL',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'NOT_CONDITIONAL',
  p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>',
  p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>',
  p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 22,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2309721116365460 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'OMIT',
  p_row_template_after_last =>'OMIT');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/search_results_report_select_link_text_link_target_detail1_detail2_last_modified
prompt  ......report template 2309827140365460
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>'||unistr('\000a')||
'<span class="title"><a href="#2#">#1#</a></span>'||unistr('\000a')||
'<span class="description"><span class="last_modified">#5#</span>#3#</span>'||unistr('\000a')||
'<span class="type">#4#</span>'||unistr('\000a')||
'</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2309827140365460 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Search Results Report (SELECT link_text, link_target, detail1, detail2, last_modified)',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<ul class="sSearchResultsReport">',
  p_row_template_after_rows =>'</ul> '||unistr('\000a')||
'#PAGINATION#',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>',
  p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>',
  p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 22,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard
prompt  ......report template 2309927354365460
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2309927354365460 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="report-standard">',
  p_row_template_after_rows =>'</table><div class="CSV">#EXTERNAL_LINK##CSV_LINK#</div></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>',
  p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>',
  p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_mouse_over=>'#F0F0F0',
  p_row_style_checked=>'#E8E8E8',
  p_theme_id  => 22,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2309927354365460 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_alternating_row_colors
prompt  ......report template 2310010284365460
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="data"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c2:=c2||'<td class="dataalt"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2310010284365460 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard, Alternating Row Colors',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" class="report-holder">#TOP_PAGINATION#<tr><td>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" class="report-standard-alternatingrowcolors" summary="" >',
  p_row_template_after_rows =>'</table><div class="CSV">#EXTERNAL_LINK##CSV_LINK#</div></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="header"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'ODD_ROW_NUMBERS',
  p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>',
  p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>',
  p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 22,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2310010284365460 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>'||unistr('\000a')||
'');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/two_column_portlet
prompt  ......report template 2310102124365460
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<div class="report-row">'||unistr('\000a')||
'  <div class="report-col-hdr">#1#</div>'||unistr('\000a')||
'  <div class="report-col-val">#2#</div>'||unistr('\000a')||
'</div>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2310102124365460 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Two Column Portlet',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div class="two-col-report-portlet" #REPORT_ATTRIBUTES# id="#REGION_ID#">',
  p_row_template_after_rows =>'</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => 22,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/value_attribute_pairs_div
prompt  ......report template 2310226873365460
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<div class="report-row">'||unistr('\000a')||
'  <div class="report-col-hdr">#COLUMN_HEADER#</div>'||unistr('\000a')||
'  <div class="report-col-val">#COLUMN_VALUE#</div>'||unistr('\000a')||
'</div>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2310226873365460 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs - Div',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div class="two-col-report-portlet">',
  p_row_template_after_rows =>'</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => 22,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/value_attribute_pairs_table
prompt  ......report template 2310325191365460
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<tr><th class="header">#COLUMN_HEADER#</th><td class="data">#COLUMN_VALUE#</td></tr>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2310325191365460 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs - Table',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" class="ValueAttributePairsParent">#TOP_PAGINATION#<tr><td><table cellpadding="0" cellspacing="0" border="0" summary="" class="ValueAttributePairs">',
  p_row_template_after_rows =>'</table><div class="CSV">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>',
  p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>',
  p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 22,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

prompt  ...label templates
--
--application/shared_components/user_interface/templates/label/no_label
prompt  ......label template 2312428131365510
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 2312428131365510 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="hidden-label">',
  p_template_body2=>'</span>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t1InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 22,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional
prompt  ......label template 2312526594365514
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 2312526594365514 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="optional">',
  p_template_body2=>'</span></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t1InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 22,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_with_help
prompt  ......label template 2312603537365515
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 2312603537365515 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="optional-w-help" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t1InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 22,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required
prompt  ......label template 2312731609365515
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 2312731609365515 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><img src="#IMAGE_PREFIX#themes/theme_22/images/required.png" alt="#VALUE_REQUIRED#" tabindex="999" /> <span class="required">',
  p_template_body2=>'</span></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t1InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 22,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_with_help
prompt  ......label template 2312829329365515
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 2312829329365515 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="required-w-help" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999"><img src="#IMAGE_PREFIX#themes/theme_22/images/required.png" alt="#VALUE_REQUIRED#" tabindex="999" /> ',
  p_template_body2=>'</a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t1InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 22,
  p_theme_class_id => 2,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
--application/shared_components/user_interface/templates/breadcrumb/breadcrumb_menu
prompt  ......template 2313608974365556
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 2313608974365556 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'<div id="breadcrumb_container">'||unistr('\000a')||
'	<ul>'||unistr('\000a')||
'		<li class="open"><span></span></li>',
  p_current_page_option=>'		<li class="active"><a href="#LINK#">#NAME#</a></li>',
  p_non_current_page_option=>'		<li><a href="#LINK#">#NAME#</a></li>',
  p_menu_link_attributes=>'',
  p_between_levels=>'		<li class="sep"><span></span></li>',
  p_after_last=>'		<li class="close"><span></span></li>'||unistr('\000a')||
'	</ul>'||unistr('\000a')||
'</div>',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 22,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/breadcrumb/hierarchical_menu
prompt  ......template 2313717539365575
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 2313717539365575 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Hierarchical Menu',
  p_before_first=>'<ul class="t1HierarchicalMenu">',
  p_current_page_option=>'<li class="t1current">#NAME#</li>',
  p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>',
  p_menu_link_attributes=>'',
  p_between_levels=>'',
  p_after_last=>'</ul>',
  p_max_levels=>11,
  p_start_with_node=>'CHILD_MENU',
  p_theme_id  => 22,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/popuplov
prompt  ...popup list of values templates
--
prompt  ......template 2314124385365628
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 2314124385365628 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#themes/theme_22/images/sPopupLOVIcon.png',
  p_popup_icon_attr=>'alt="#LIST_OF_VALUES#" title="#LIST_OF_VALUES#"',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" media="all"/>'||unistr('\000a')||
'#THEME_CSS#',
  p_page_body_attr=>'onload="first_field()" class="pop-up-lov"',
  p_before_field_text=>'<div class="t1PopupHead">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<div style="padding:5px 10px; font-size:10px;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>500,
  p_before_result_set=>'<div class="t1PopupBody">',
  p_theme_id  => 22,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

prompt  ...calendar templates
--
--application/shared_components/user_interface/templates/calendar/calendar
prompt  ......template 2313808301365598
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 2313808301365598 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th scope="col" class="DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="CalendarHolder"> '||unistr('\000a')||
' <tr>'||unistr('\000a')||
'   <td class="MonthTitle">#IMONTH# #YYYY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #IMONTH# #YYYY#" class="Calendar">',
  p_month_close_format=> '</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'',
  p_day_title_format=> '<div class="DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="Day" valign="top">#TITLE_FORMAT##DATA#',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="Today">#TITLE_FORMAT##DATA#',
  p_weekend_title_format=> '<div class="WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="WeekendDay">#TITLE_FORMAT##DATA#',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="WeekCalendarHolder">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="MonthTitle" id="test">#WTITLE#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>',
  p_weekly_day_of_week_format => '<th scope="col" class="DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="WeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th scope="row" class="Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th scope="col" class="DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'||unistr('\000a')||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="DayCalendar">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="Today">',
  p_daily_time_open_format => '<th scope="row" class="Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_agenda_format => '<table class="ListCalendarHolder" summary="" role="presentation"><tr><td class="MonthTitle">#LTITLE#</td></tr><tr><td><table class="ListCalendar" summary="#CALENDAR_TITLE# #LTITLE#">#DAYS#</td></tr></table>',
  p_agenda_past_day_format => '<tr> <th id="#MON#_#DD#_#YYYY#" colspan="2" class="PastDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>',
  p_agenda_today_day_format => '<tr>  <th  id="#MON#_#DD#_#YYYY#" colspan="2"  class="ToDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>',
  p_agenda_future_day_format => '<tr>   <th  id="#MON#_#DD#_#YYYY#" colspan="2" class="FutureDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>',
  p_agenda_past_entry_format => '<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="PastHour" >#TIME#</th><td class="PastDay" headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>',
  p_agenda_today_entry_format => '<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="TodayHour" >#TIME#</th><td class="ToDay"  headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>',
  p_agenda_future_entry_format => '<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="FutureHour" >#TIME#</th><td class="FutureDay"  headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>',
  p_month_data_format => '',
  p_month_data_entry_format => '#DATA#',
  p_theme_id  => 22,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/calendar_alternative_1
prompt  ......template 2313917624365618
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 2313917624365618 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar, Alternative 1',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th scope="col" valign="bottom" class="DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="CalendarAlternative1Holder"> '||unistr('\000a')||
' <tr>'||unistr('\000a')||
'   <td class="MonthTitle">#IMONTH# #YYYY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #IMONTH# #YYYY#" class="CalendarAlternative1">',
  p_month_close_format=> '</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'',
  p_day_title_format=> '<div class="DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="Day" valign="top" height="100" height="100">#TITLE_FORMAT##DATA#',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="Today">#TITLE_FORMAT##DATA#',
  p_weekend_title_format=> '<div class="WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="WeekendDay">#TITLE_FORMAT##DATA#',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="WeekCalendarAlternative1Holder">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="MonthTitle">#WTITLE#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>',
  p_weekly_day_of_week_format => '<th scope="col" class="DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="WeekCalendarAlternative1">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th scope="row" class="Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th scope="col" class="DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="DayCalendarAlternative1Holder"> <tr><td class="MonthTitle">#IMONTH# #DD#, #YYYY#</td></tr><tr><td>'||unistr('\000a')||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="DayCalendarAlternative1">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="Today">',
  p_daily_time_open_format => '<th scope="row" class="Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_agenda_format => '<table class="ListCalendarAlternateHolder" summary="" role="presentation"><tr><td class="MonthTitle">#LTITLE#</td></tr><tr><td><table class="ListCalendarAlternate" summary="#CALENDAR_TITLE# #LTITLE#">#DAYS#</td></tr></table>''',
  p_agenda_past_day_format => '<tr> <th id="#MON#_#DD#_#YYYY#" colspan="2" class="PastDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>',
  p_agenda_today_day_format => '<tr>  <th  id="#MON#_#DD#_#YYYY#" colspan="2"  class="ToDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>',
  p_agenda_future_day_format => '<tr>   <th  id="#MON#_#DD#_#YYYY#" colspan="2" class="FutureDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>',
  p_agenda_past_entry_format => '<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="PastHour" >#TIME#</th><td class="PastDay" headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>',
  p_agenda_today_entry_format => '<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="TodayHour" >#TIME#</th><td class="ToDay"  headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>',
  p_agenda_future_entry_format => '<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="FutureHour" >#TIME#</th><td class="FutureDay"  headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>',
  p_month_data_format => '',
  p_month_data_entry_format => '#DATA#',
  p_theme_id  => 22,
  p_theme_class_id => 2,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/small_calendar
prompt  ......template 2314027017365620
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 2314027017365620 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Small Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th scope="col" class="day-of-week">#DY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="small-calendar-holder"> '||unistr('\000a')||
' <tr>'||unistr('\000a')||
'   <td class="month-title">#IMONTH# #YYYY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #IMONTH# #YYYY#" class="small-calendar">',
  p_month_close_format=> '</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>',
  p_day_title_format=> '<div class="day-title">#DD#</div>',
  p_day_open_format=> '<td class="day" valign="top">#TITLE_FORMAT##DATA#',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="today">#TITLE_FORMAT##DATA#',
  p_weekend_title_format=> '<div class="weekend-day-title">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="weekend-day">#TITLE_FORMAT##DATA#',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="non-day-title">#DD#</div>',
  p_nonday_open_format => '<td class="non-day" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="SmallWeekCalendarHolder">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="MonthTitle" id="test">#WTITLE#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>',
  p_weekly_day_of_week_format => '<th scope="col" class="DayOfWeek">#DY#<br />#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="SmallWeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="Day" valign="top"><div class="inner">',
  p_weekly_day_close_format => '</div></td>',
  p_weekly_today_open_format => '<td class="t1Today" valign="top"><div class="inner">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="NonDay"><div class="inner">',
  p_weekly_weekend_close_format => '</div></td>',
  p_weekly_time_open_format => '<th scope="row" class="Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th scope="col" class="DayOfWeek">#DY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" role="presentation" class="SmallDayCalendarHolder"> <tr> <td class="MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr><tr><td>'||unistr('\000a')||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="SmallDayCalendar">',
  p_daily_month_close_format => '</table></td></tr></table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="Today">',
  p_daily_time_open_format => '<th scope="row" class="Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_agenda_format => '<table class="ListCalendarSmallHolder" summary="" role="presentation"><tr><td class="MonthTitle">#LTITLE#</td></tr><tr><td><table class="ListCalendarSmall" summary="#CALENDAR_TITLE# #LTITLE#">#DAYS#</td></tr></table>''',
  p_agenda_past_day_format => '<tr> <th id="#MON#_#DD#_#YYYY#" colspan="2" class="PastDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>',
  p_agenda_today_day_format => '<tr>  <th  id="#MON#_#DD#_#YYYY#" colspan="2"  class="ToDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>',
  p_agenda_future_day_format => '<tr>   <th  id="#MON#_#DD#_#YYYY#" colspan="2" class="FutureDayTitle" >#IMON# #DD# #YYYY#  </th>   </tr>',
  p_agenda_past_entry_format => '<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="PastHour" >#TIME#</th><td class="PastDay" headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>',
  p_agenda_today_entry_format => '<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="TodayHour" >#TIME#</th><td class="ToDay"  headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>',
  p_agenda_future_entry_format => '<tr>   <th headers="#MON#_#DD#_#YYYY#" id="#MON#_#DD#_#YYYY#_#DAY_SEQ#" class="FutureHour" >#TIME#</th><td class="FutureDay"  headers="#MON#_#DD#_#YYYY# #MON#_#DD#_#YYYY#_#DAY_SEQ#">#DATA#</td>   </tr>',
  p_month_data_format => '',
  p_month_data_entry_format => '#DATA#',
  p_theme_id  => 22,
  p_theme_class_id => 3,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ...application themes
--
--application/shared_components/user_interface/themes/bluejay
prompt  ......theme 2314220173365643
begin
wwv_flow_api.create_theme (
  p_id =>2314220173365643 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 22,
  p_theme_name=>'Bluejay',
  p_ui_type_name=>'DESKTOP',
  p_is_locked=>false,
  p_default_page_template=>2305701644365307 + wwv_flow_api.g_id_offset,
  p_error_template=>2305306700365301 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>2305901539365310 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template=>2304930986365265 + wwv_flow_api.g_id_offset,
  p_default_button_template=>2312915180365529 + wwv_flow_api.g_id_offset,
  p_default_region_template=>2308330636365382 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>2307327633365368 + wwv_flow_api.g_id_offset,
  p_default_form_template  =>2307410395365368 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>2308330636365382 + wwv_flow_api.g_id_offset,
  p_default_tabform_template=>2308330636365382 + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>2309201180365431 + wwv_flow_api.g_id_offset,
  p_default_menur_template=>2306805403365368 + wwv_flow_api.g_id_offset,
  p_default_listr_template=>2307218410365368 + wwv_flow_api.g_id_offset,
  p_default_irr_template=>2307931192365371 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>2309927354365460 + wwv_flow_api.g_id_offset,
  p_default_label_template=>2312603537365515 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>2313608974365556 + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>2313808301365598 + wwv_flow_api.g_id_offset,
  p_default_list_template=>2311918637365504 + wwv_flow_api.g_id_offset,
  p_default_option_label=>2312603537365515 + wwv_flow_api.g_id_offset,
  p_default_header_template=>null + wwv_flow_api.g_id_offset,
  p_default_footer_template=>null + wwv_flow_api.g_id_offset,
  p_default_page_transition=>'NONE',
  p_default_popup_transition=>'NONE',
  p_default_required_label=>2312829329365515 + wwv_flow_api.g_id_offset);
end;
/
 
prompt  ...theme styles
--
 
begin
 
null;
 
end;
/

prompt  ...theme display points
--
 
begin
 
null;
 
end;
/

prompt  ...build options
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/language
prompt  ...Language Maps for Application 102
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/messages
prompt  ...text messages
--
--application/shared_components/globalization/dyntranslations
prompt  ...dynamic translations
--
prompt  ...Shortcuts
--
prompt  ...web services (9iR2 or better)
--
prompt  ...shared queries
--
prompt  ...report layouts
--
prompt  ...authentication schemes
--
--application/shared_components/security/authentication/application_express_authentication
prompt  ......authentication 2314503765365867
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 2314503765365867 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Application Express Authentication'
 ,p_scheme_type => 'NATIVE_APEX_ACCOUNTS'
 ,p_invalid_session_type => 'LOGIN'
 ,p_use_secure_cookie_yn => 'N'
  );
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

prompt  ...plugins
--
prompt  ...data loading
--
prompt  ...post import process
 
begin
 
wwv_flow_api.post_import_process(p_flow_id => wwv_flow.g_flow_id);
null;
 
end;
/

--application/end_environment
commit;
commit;
begin
execute immediate 'begin sys.dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
set define on
prompt  ...done
