create or replace package user_pck is
  --��¼
  procedure s_self_login(in_userid in varchar2
                        ,in_userpwd  in varchar2
                        ,out_option  out number
                        ,out_username out varchar2);
  ------------------------------------------------------------------------------------------
end user_pck;
/
create or replace package body user_pck is
  --ͨ�ô�����Ϣ
  e_start          constant integer := -20002;
  e_repeat_record  constant integer := e_start - 1; --�ظ��ļ�¼
  e_invalid_record constant integer := e_repeat_record - 1; --��Ч������
  e_non_own_record constant integer := e_invalid_record - 1; --�����Լ��ļ�¼
  e_has_been_used  constant integer := e_non_own_record - 1; --�ѱ�ʹ��
  e_too_many_rows  constant integer := e_has_been_used - 1; --���ص�ֵ̫��
  ------------------------------------------------------------------------------------------
  --��¼
  procedure s_self_login(in_userid in varchar2
                        ,in_userpwd  in varchar2
                        ,out_option  out number
                        ,out_username out varchar2) is
    v_userpwd self.user_pwd.userpwd%type;
  begin
    --��֤�����Ƿ����
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
