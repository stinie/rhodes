%module "Rho::Calendar"
%{
#include "ext/rho/rhoruby.h"

extern VALUE event_fetch(VALUE start_date, VALUE end_date);
#define fetch event_fetch
extern VALUE event_fetch_by_id(const char *id);
#define fetch_by_id event_fetch_by_id
extern void event_save(VALUE event);
#define save event_save
extern void event_delete(const char *id);
#define delete event_delete
%}

%typemap(check) VALUE {
    VALUE cTime = rb_class_of($1);
    if (!rb_equal(cTime, rb_cTime))
        rb_raise(rb_eArgError, "Time expected");
}

extern VALUE fetch(VALUE start_date, VALUE end_date);
%rename(fetch) fetch_by_id;
extern VALUE fetch_by_id(const char *id);

%typemap(check) VALUE {
    Check_Type($1, T_HASH);
}
extern void save(VALUE event);

extern void delete(const char *id);
