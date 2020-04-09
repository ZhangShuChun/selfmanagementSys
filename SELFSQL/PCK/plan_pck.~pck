create or replace package plan_pck is
  ------------------------------------------------------------------------------------------
  procedure s_self_plan(id varchar2);
  ------------------------------------------------------------------------------------------
end plan_pck;
/
create or replace package body plan_pck is
  ------------------------------------------------------------------------------------------
  procedure s_self_plan(id varchar2) is
    i integer;
  begin
    select 2 into i from self.plan;
    commit;
  end s_self_plan;
  ------------------------------------------------------------------------------------------

end plan_pck;
/
