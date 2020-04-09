create or replace package user_pck is
  --登录
  procedure s_self_login(in_userid in varchar2
                        ,in_userpwd  in varchar2
                        ,out_option  out number
                        ,out_username out varchar2);
  ------------------------------------------------------------------------------------------
end user_pck;
/
create or replace package body user_pck is
  --通用错误信息
  e_start          constant integer := -20002;
  e_repeat_record  constant integer := e_start - 1; --重复的记录
  e_invalid_record constant integer := e_repeat_record - 1; --无效的数据
  e_non_own_record constant integer := e_invalid_record - 1; --不是自己的记录
  e_has_been_used  constant integer := e_non_own_record - 1; --已被使用
  e_too_many_rows  constant integer := e_has_been_used - 1; --返回的值太多
  ------------------------------------------------------------------------------------------
  --登录
  procedure s_self_login(in_userid in varchar2
                        ,in_userpwd  in varchar2
                        ,out_option  out number
                        ,out_username out varchar2) is
    v_userpwd self.user_pwd.userpwd%type;
  begin
    --验证数据是否存在
    begin
      select userpwd
        into v_userpwd
        from self.user_pwd
       where userid = in_userid;
    exception
      when others then
        out_option := '1';
        return;
    end;
    if v_userpwd != in_userpwd
    then
      out_option := '2';
      return;
    end if;
    out_option := '0';
  end s_self_login;
  ------------------------------------------------------------------------------------------
end user_pck;
/
