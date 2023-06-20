# 1 "sa.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "sa.c"
# 1 "/usr/include/time.h" 1 3 4
# 25 "/usr/include/time.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 461 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 452 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 453 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/long-double.h" 1 3 4
# 454 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 462 "/usr/include/features.h" 2 3 4
# 485 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 486 "/usr/include/features.h" 2 3 4
# 26 "/usr/include/time.h" 2 3 4



# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 209 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 3 4

# 209 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 30 "/usr/include/time.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/time.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/time.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 1 3 4
# 29 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;






typedef __int8_t __int_least8_t;
typedef __uint8_t __uint_least8_t;
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
typedef __int64_t __int_least64_t;
typedef __uint64_t __uint_least64_t;



typedef long int __quad_t;
typedef unsigned long int __u_quad_t;







typedef long int __intmax_t;
typedef unsigned long int __uintmax_t;
# 141 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/typesizes.h" 1 3 4
# 142 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/time64.h" 1 3 4
# 143 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;




typedef int __sig_atomic_t;
# 27 "/usr/include/x86_64-linux-gnu/bits/time.h" 2 3 4
# 34 "/usr/include/time.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h" 1 3 4






typedef __clock_t clock_t;
# 38 "/usr/include/time.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h" 1 3 4






typedef __time_t time_t;
# 39 "/usr/include/time.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h" 1 3 4






struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;


  long int tm_gmtoff;
  const char *tm_zone;




};
# 40 "/usr/include/time.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h" 1 3 4





# 1 "/usr/include/x86_64-linux-gnu/bits/endian.h" 1 3 4
# 35 "/usr/include/x86_64-linux-gnu/bits/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/endianness.h" 1 3 4
# 36 "/usr/include/x86_64-linux-gnu/bits/endian.h" 2 3 4
# 7 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h" 2 3 4



struct timespec
{
  __time_t tv_sec;



  __syscall_slong_t tv_nsec;
# 26 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h" 3 4
};
# 43 "/usr/include/time.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/types/clockid_t.h" 1 3 4






typedef __clockid_t clockid_t;
# 47 "/usr/include/time.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/timer_t.h" 1 3 4






typedef __timer_t timer_t;
# 48 "/usr/include/time.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_itimerspec.h" 1 3 4







struct itimerspec
  {
    struct timespec it_interval;
    struct timespec it_value;
  };
# 49 "/usr/include/time.h" 2 3 4
struct sigevent;




typedef __pid_t pid_t;





# 1 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/__locale_t.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types/__locale_t.h" 3 4
struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
};

typedef struct __locale_struct *__locale_t;
# 23 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h" 2 3 4

typedef __locale_t locale_t;
# 61 "/usr/include/time.h" 2 3 4











extern clock_t clock (void) __attribute__ ((__nothrow__ , __leaf__));


extern time_t time (time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));


extern double difftime (time_t __time1, time_t __time0)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern time_t mktime (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));





extern size_t strftime (char *__restrict __s, size_t __maxsize,
   const char *__restrict __format,
   const struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));
# 104 "/usr/include/time.h" 3 4
extern size_t strftime_l (char *__restrict __s, size_t __maxsize,
     const char *__restrict __format,
     const struct tm *__restrict __tp,
     locale_t __loc) __attribute__ ((__nothrow__ , __leaf__));
# 119 "/usr/include/time.h" 3 4
extern struct tm *gmtime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));



extern struct tm *localtime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));




extern struct tm *gmtime_r (const time_t *__restrict __timer,
       struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));



extern struct tm *localtime_r (const time_t *__restrict __timer,
          struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));




extern char *asctime (const struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern char *ctime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));






extern char *asctime_r (const struct tm *__restrict __tp,
   char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));


extern char *ctime_r (const time_t *__restrict __timer,
        char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));




extern char *__tzname[2];
extern int __daylight;
extern long int __timezone;




extern char *tzname[2];



extern void tzset (void) __attribute__ ((__nothrow__ , __leaf__));



extern int daylight;
extern long int timezone;
# 190 "/usr/include/time.h" 3 4
extern time_t timegm (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern time_t timelocal (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern int dysize (int __year) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 205 "/usr/include/time.h" 3 4
extern int nanosleep (const struct timespec *__requested_time,
        struct timespec *__remaining);



extern int clock_getres (clockid_t __clock_id, struct timespec *__res) __attribute__ ((__nothrow__ , __leaf__));


extern int clock_gettime (clockid_t __clock_id, struct timespec *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern int clock_settime (clockid_t __clock_id, const struct timespec *__tp)
     __attribute__ ((__nothrow__ , __leaf__));






extern int clock_nanosleep (clockid_t __clock_id, int __flags,
       const struct timespec *__req,
       struct timespec *__rem);


extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) __attribute__ ((__nothrow__ , __leaf__));




extern int timer_create (clockid_t __clock_id,
    struct sigevent *__restrict __evp,
    timer_t *__restrict __timerid) __attribute__ ((__nothrow__ , __leaf__));


extern int timer_delete (timer_t __timerid) __attribute__ ((__nothrow__ , __leaf__));


extern int timer_settime (timer_t __timerid, int __flags,
     const struct itimerspec *__restrict __value,
     struct itimerspec *__restrict __ovalue) __attribute__ ((__nothrow__ , __leaf__));


extern int timer_gettime (timer_t __timerid, struct itimerspec *__value)
     __attribute__ ((__nothrow__ , __leaf__));


extern int timer_getoverrun (timer_t __timerid) __attribute__ ((__nothrow__ , __leaf__));
# 301 "/usr/include/time.h" 3 4

# 2 "sa.c" 2
# 1 "/usr/include/math.h" 1 3 4
# 27 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 28 "/usr/include/math.h" 2 3 4












# 1 "/usr/include/x86_64-linux-gnu/bits/math-vector.h" 1 3 4
# 25 "/usr/include/x86_64-linux-gnu/bits/math-vector.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libm-simd-decl-stubs.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/math-vector.h" 2 3 4
# 41 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/floatn.h" 1 3 4
# 120 "/usr/include/x86_64-linux-gnu/bits/floatn.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/long-double.h" 1 3 4
# 25 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 2 3 4
# 121 "/usr/include/x86_64-linux-gnu/bits/floatn.h" 2 3 4
# 44 "/usr/include/math.h" 2 3 4
# 138 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/flt-eval-method.h" 1 3 4
# 139 "/usr/include/math.h" 2 3 4
# 149 "/usr/include/math.h" 3 4
typedef float float_t;
typedef double double_t;
# 190 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/fp-logb.h" 1 3 4
# 191 "/usr/include/math.h" 2 3 4
# 233 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/fp-fast.h" 1 3 4
# 234 "/usr/include/math.h" 2 3 4
# 289 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassify (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbit (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern int __isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __iseqsig (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


extern int __issignaling (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
# 290 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern double acos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acos (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double asin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asin (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__));


 extern double cos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cos (double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern double sin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sin (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double tan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tan (double __x) __attribute__ ((__nothrow__ , __leaf__));




extern double cosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cosh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double sinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sinh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double tanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tanh (double __x) __attribute__ ((__nothrow__ , __leaf__));
# 85 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern double acosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acosh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double asinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asinh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atanh (double __x) __attribute__ ((__nothrow__ , __leaf__));





 extern double exp (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern double ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


 extern double log (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log10 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern double __modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
# 119 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern double expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log1p (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log1p (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double logb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __logb (double __x) __attribute__ ((__nothrow__ , __leaf__));




extern double exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log2 (double __x) __attribute__ ((__nothrow__ , __leaf__));






 extern double pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


extern double sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern double hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));




extern double cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__));






extern double ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
# 177 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern int finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



extern double significand (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __significand (double __x) __attribute__ ((__nothrow__ , __leaf__));






extern double copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern double nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern double __nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
# 211 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern double j0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double j1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double jn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __jn (int, double) __attribute__ ((__nothrow__ , __leaf__));
extern double y0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double y1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double yn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __yn (int, double) __attribute__ ((__nothrow__ , __leaf__));





extern double erf (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erf (double) __attribute__ ((__nothrow__ , __leaf__));
extern double erfc (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erfc (double) __attribute__ ((__nothrow__ , __leaf__));
extern double lgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma (double) __attribute__ ((__nothrow__ , __leaf__));




extern double tgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __tgamma (double) __attribute__ ((__nothrow__ , __leaf__));





extern double gamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __gamma (double) __attribute__ ((__nothrow__ , __leaf__));







extern double lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));






extern double rint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __rint (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));

extern double nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
# 272 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern double remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



extern double scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__));
# 290 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern double scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern double nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern double round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern double trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern double remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern double __remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrint (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrint (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lround (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llround (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern double fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


extern double fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__)); extern double __fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__));
# 400 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern double scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__));
# 291 "/usr/include/math.h" 2 3 4
# 306 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassifyf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbitf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern int __isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __iseqsigf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


extern int __issignalingf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
# 307 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern float acosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acosf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float asinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__));


 extern float cosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cosf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 extern float sinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float tanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanf (float __x) __attribute__ ((__nothrow__ , __leaf__));




extern float coshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __coshf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
# 85 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern float acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));





 extern float expf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern float ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


 extern float logf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log10f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern float __modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
# 119 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern float expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float logbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logbf (float __x) __attribute__ ((__nothrow__ , __leaf__));




extern float exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log2f (float __x) __attribute__ ((__nothrow__ , __leaf__));






 extern float powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


extern float sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern float hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));




extern float cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));






extern float ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
# 177 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern int finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



extern float significandf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __significandf (float __x) __attribute__ ((__nothrow__ , __leaf__));






extern float copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern float nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern float __nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
# 211 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern float j0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float j1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float jnf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __jnf (int, float) __attribute__ ((__nothrow__ , __leaf__));
extern float y0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float y1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float ynf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __ynf (int, float) __attribute__ ((__nothrow__ , __leaf__));





extern float erff (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erff (float) __attribute__ ((__nothrow__ , __leaf__));
extern float erfcf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erfcf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float lgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf (float) __attribute__ ((__nothrow__ , __leaf__));




extern float tgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __tgammaf (float) __attribute__ ((__nothrow__ , __leaf__));





extern float gammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __gammaf (float) __attribute__ ((__nothrow__ , __leaf__));







extern float lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));






extern float rintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __rintf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));

extern float nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
# 272 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern float remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



extern float scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__));
# 290 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern float scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern float nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern float roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern float truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern float remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern float __remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern float fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


extern float fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__));
# 400 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern float scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__));
# 308 "/usr/include/math.h" 2 3 4
# 349 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassifyl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbitl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern int __isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __iseqsigl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


extern int __issignalingl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
# 350 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern long double acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__));


 extern long double cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern long double sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));




extern long double coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
# 85 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern long double acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));





 extern long double expl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern long double ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


 extern long double logl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern long double __modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
# 119 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern long double expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));




extern long double exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));






 extern long double powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


extern long double sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long double hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));




extern long double cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));






extern long double ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
# 177 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern int finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



extern long double significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__));






extern long double copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern long double nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
# 211 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern int isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern long double j0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double j1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__));





extern long double erfl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double erfcl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfcl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double lgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal (long double) __attribute__ ((__nothrow__ , __leaf__));




extern long double tgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tgammal (long double) __attribute__ ((__nothrow__ , __leaf__));





extern long double gammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __gammal (long double) __attribute__ ((__nothrow__ , __leaf__));







extern long double lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));






extern long double rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));

extern long double nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
# 272 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern long double remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



extern long double scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
# 290 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern long double scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern long double nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long double roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern long double truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern long double remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long double fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


extern long double fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__));
# 400 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern long double scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__));
# 351 "/usr/include/math.h" 2 3 4
# 420 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h" 3 4
extern int __fpclassifyf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbitf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern int __isinff128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finitef128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __isnanf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __iseqsigf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));


extern int __issignalingf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
# 421 "/usr/include/math.h" 2 3 4
# 773 "/usr/include/math.h" 3 4
extern int signgam;
# 853 "/usr/include/math.h" 3 4
enum
  {
    FP_NAN =

      0,
    FP_INFINITE =

      1,
    FP_ZERO =

      2,
    FP_SUBNORMAL =

      3,
    FP_NORMAL =

      4
  };
# 1245 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathinline.h" 1 3 4
# 1246 "/usr/include/math.h" 2 3 4
# 1338 "/usr/include/math.h" 3 4

# 3 "sa.c" 2
# 1 "/usr/include/assert.h" 1 3 4
# 4 "sa.c" 2
# 1 "/usr/include/bsd/stdlib.h" 1 3 4
# 32 "/usr/include/bsd/stdlib.h" 3 4
# 1 "/usr/include/stdlib.h" 1 3 4
# 25 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 26 "/usr/include/stdlib.h" 2 3 4





# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 321 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 3 4
typedef int wchar_t;
# 32 "/usr/include/stdlib.h" 2 3 4







# 1 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 1 3 4
# 52 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 3 4
typedef enum
{
  P_ALL,
  P_PID,
  P_PGID
} idtype_t;
# 40 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 1 3 4
# 41 "/usr/include/stdlib.h" 2 3 4
# 58 "/usr/include/stdlib.h" 3 4
typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;





__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;
# 97 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));

extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));

extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));



__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));



extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 176 "/usr/include/stdlib.h" 3 4
extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 360 "/usr/include/stdlib.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) atoi (const char *__nptr)
{
  return (int) strtol (__nptr, (char **) ((void *)0), 10);
}
extern __inline __attribute__ ((__gnu_inline__)) long int
__attribute__ ((__nothrow__ , __leaf__)) atol (const char *__nptr)
{
  return strtol (__nptr, (char **) ((void *)0), 10);
}


__extension__ extern __inline __attribute__ ((__gnu_inline__)) long long int
__attribute__ ((__nothrow__ , __leaf__)) atoll (const char *__nptr)
{
  return strtoll (__nptr, (char **) ((void *)0), 10);
}
# 385 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));


extern long int a64l (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));




# 1 "/usr/include/x86_64-linux-gnu/sys/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4






typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;


typedef __loff_t loff_t;




typedef __ino_t ino_t;
# 59 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;
# 103 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;
# 144 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 145 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;




# 1 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h" 3 4
typedef __int8_t int8_t;
typedef __int16_t int16_t;
typedef __int32_t int32_t;
typedef __int64_t int64_t;
# 156 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


typedef __uint8_t u_int8_t;
typedef __uint16_t u_int16_t;
typedef __uint32_t u_int32_t;
typedef __uint64_t u_int64_t;


typedef int register_t __attribute__ ((__mode__ (__word__)));
# 176 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 35 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 1 3 4
# 33 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline __uint16_t
__bswap_16 (__uint16_t __bsx)
{

  return __builtin_bswap16 (__bsx);



}






static __inline __uint32_t
__bswap_32 (__uint32_t __bsx)
{

  return __builtin_bswap32 (__bsx);



}
# 69 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
__extension__ static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{

  return __builtin_bswap64 (__bsx);



}
# 36 "/usr/include/endian.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h" 1 3 4
# 32 "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h" 3 4
static __inline __uint16_t
__uint16_identity (__uint16_t __x)
{
  return __x;
}

static __inline __uint32_t
__uint32_identity (__uint32_t __x)
{
  return __x;
}

static __inline __uint64_t
__uint64_identity (__uint64_t __x)
{
  return __x;
}
# 37 "/usr/include/endian.h" 2 3 4
# 177 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/sys/select.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/select.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/select.h" 2 3 4
# 31 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h" 1 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h" 1 3 4




typedef struct
{
  unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
} __sigset_t;
# 5 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h" 2 3 4


typedef __sigset_t sigset_t;
# 34 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h" 1 3 4







struct timeval
{
  __time_t tv_sec;
  __suseconds_t tv_usec;
};
# 38 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4





typedef __suseconds_t suseconds_t;





typedef long int __fd_mask;
# 59 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef struct
  {






    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];


  } fd_set;






typedef __fd_mask fd_mask;
# 91 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4

# 101 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 113 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);





# 1 "/usr/include/x86_64-linux-gnu/bits/select2.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/select2.h" 3 4
extern long int __fdelt_chk (long int __d);
extern long int __fdelt_warn (long int __d)
  __attribute__((__warning__ ("bit outside of fd_set selected")));
# 124 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4



# 180 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4





typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 227 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 1 3 4
# 44 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h" 2 3 4
# 45 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 2 3 4




typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;

typedef struct __pthread_internal_slist
{
  struct __pthread_internal_slist *__next;
} __pthread_slist_t;
# 74 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h" 3 4
struct __pthread_mutex_s
{
  int __lock;
  unsigned int __count;
  int __owner;

  unsigned int __nusers;



  int __kind;

  short __spins;
  short __elision;
  __pthread_list_t __list;
# 53 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h" 3 4
};
# 75 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 2 3 4
# 87 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/struct_rwlock.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/struct_rwlock.h" 3 4
struct __pthread_rwlock_arch_t
{
  unsigned int __readers;
  unsigned int __writers;
  unsigned int __wrphase_futex;
  unsigned int __writers_futex;
  unsigned int __pad3;
  unsigned int __pad4;

  int __cur_writer;
  int __shared;
  signed char __rwelision;




  unsigned char __pad1[7];


  unsigned long int __pad2;


  unsigned int __flags;
# 55 "/usr/include/x86_64-linux-gnu/bits/struct_rwlock.h" 3 4
};
# 88 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 2 3 4




struct __pthread_cond_s
{
  __extension__ union
  {
    __extension__ unsigned long long int __wseq;
    struct
    {
      unsigned int __low;
      unsigned int __high;
    } __wseq32;
  };
  __extension__ union
  {
    __extension__ unsigned long long int __g1_start;
    struct
    {
      unsigned int __low;
      unsigned int __high;
    } __g1_start32;
  };
  unsigned int __g_refs[2] ;
  unsigned int __g_size[2];
  unsigned int __g1_orig_size;
  unsigned int __wrefs;
  unsigned int __g_signals[2];
};
# 24 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 2 3 4



typedef unsigned long int pthread_t;




typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;


union pthread_attr_t
{
  char __size[56];
  long int __align;
};

typedef union pthread_attr_t pthread_attr_t;




typedef union
{
  struct __pthread_mutex_s __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;


typedef union
{
  struct __pthread_cond_s __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;





typedef union
{
  struct __pthread_rwlock_arch_t __data;
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 228 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



# 395 "/usr/include/stdlib.h" 2 3 4






extern long int random (void) __attribute__ ((__nothrow__ , __leaf__));


extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));





extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));



extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ , __leaf__));







extern double drand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ , __leaf__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    __extension__ unsigned long long int __a;

  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__))
     __attribute__ ((__alloc_size__ (1))) __attribute__ ((__warn_unused_result__));

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (1, 2))) __attribute__ ((__warn_unused_result__));






extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__)) __attribute__ ((__alloc_size__ (2)));







extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__))
     __attribute__ ((__alloc_size__ (2, 3)));



extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));


# 1 "/usr/include/alloca.h" 1 3 4
# 24 "/usr/include/alloca.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 25 "/usr/include/alloca.h" 2 3 4







extern void *alloca (size_t __size) __attribute__ ((__nothrow__ , __leaf__));






# 569 "/usr/include/stdlib.h" 2 3 4





extern void *valloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__))
     __attribute__ ((__alloc_size__ (1))) __attribute__ ((__warn_unused_result__));




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
# 591 "/usr/include/stdlib.h" 3 4
extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 610 "/usr/include/stdlib.h" 3 4
extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
# 629 "/usr/include/stdlib.h" 3 4
extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));




extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
# 647 "/usr/include/stdlib.h" 3 4
extern int putenv (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern int clearenv (void) __attribute__ ((__nothrow__ , __leaf__));
# 675 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 688 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
# 710 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
# 731 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
# 784 "/usr/include/stdlib.h" 3 4
extern int system (const char *__command) __attribute__ ((__warn_unused_result__));
# 800 "/usr/include/stdlib.h" 3 4
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));






typedef int (*__compar_fn_t) (const void *, const void *);
# 820 "/usr/include/stdlib.h" 3 4
extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) __attribute__ ((__warn_unused_result__));


# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h" 1 3 4
# 19 "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) void *
bsearch (const void *__key, const void *__base, size_t __nmemb, size_t __size,
  __compar_fn_t __compar)
{
  size_t __l, __u, __idx;
  const void *__p;
  int __comparison;

  __l = 0;
  __u = __nmemb;
  while (__l < __u)
    {
      __idx = (__l + __u) / 2;
      __p = (void *) (((const char *) __base) + (__idx * __size));
      __comparison = (*__compar) (__key, __p);
      if (__comparison < 0)
 __u = __idx;
      else if (__comparison > 0)
 __l = __idx + 1;
      else
 return (void *) __p;
    }

  return ((void *)0);
}
# 826 "/usr/include/stdlib.h" 2 3 4




extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 840 "/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));


__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));






extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));


__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));
# 872 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) __attribute__ ((__warn_unused_result__));




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) __attribute__ ((__warn_unused_result__));




extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) __attribute__ ((__warn_unused_result__));




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) __attribute__ ((__warn_unused_result__));
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) __attribute__ ((__warn_unused_result__));
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) __attribute__ ((__warn_unused_result__));




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));





extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__));



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__));







extern int rpmatch (const char *__response) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
# 957 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3))) __attribute__ ((__warn_unused_result__));
# 1003 "/usr/include/stdlib.h" 3 4
extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 1013 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) double
__attribute__ ((__nothrow__ , __leaf__)) atof (const char *__nptr)
{
  return strtod (__nptr, (char **) ((void *)0));
}
# 1014 "/usr/include/stdlib.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/stdlib.h" 3 4
extern char *__realpath_chk (const char *__restrict __name,
        char *__restrict __resolved,
        size_t __resolvedlen) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern char *__realpath_alias (const char *__restrict __name, char *__restrict __resolved) __asm__ ("" "realpath") __attribute__ ((__nothrow__ , __leaf__))

                                                 __attribute__ ((__warn_unused_result__));
extern char *__realpath_chk_warn (const char *__restrict __name, char *__restrict __resolved, size_t __resolvedlen) __asm__ ("" "__realpath_chk") __attribute__ ((__nothrow__ , __leaf__))


                                                __attribute__ ((__warn_unused_result__))
     __attribute__((__warning__ ("second argument of realpath must be either NULL or at " "least PATH_MAX bytes long buffer")))
                                      ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) char *
__attribute__ ((__nothrow__ , __leaf__)) realpath (const char *__restrict __name, char *__restrict __resolved)
{
  if (__builtin_object_size (__resolved, 2 > 1) != (size_t) -1)
    {




      return __realpath_chk (__name, __resolved, __builtin_object_size (__resolved, 2 > 1));
    }

  return __realpath_alias (__name, __resolved);
}


extern int __ptsname_r_chk (int __fd, char *__buf, size_t __buflen,
       size_t __nreal) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int __ptsname_r_alias (int __fd, char *__buf, size_t __buflen) __asm__ ("" "ptsname_r") __attribute__ ((__nothrow__ , __leaf__))

     __attribute__ ((__nonnull__ (2)));
extern int __ptsname_r_chk_warn (int __fd, char *__buf, size_t __buflen, size_t __nreal) __asm__ ("" "__ptsname_r_chk") __attribute__ ((__nothrow__ , __leaf__))


     __attribute__ ((__nonnull__ (2))) __attribute__((__warning__ ("ptsname_r called with buflen bigger than " "size of buf")))
                   ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) ptsname_r (int __fd, char *__buf, size_t __buflen)
{
  if (__builtin_object_size (__buf, 2 > 1) != (size_t) -1)
    {
      if (!__builtin_constant_p (__buflen))
 return __ptsname_r_chk (__fd, __buf, __buflen, __builtin_object_size (__buf, 2 > 1));
      if (__buflen > __builtin_object_size (__buf, 2 > 1))
 return __ptsname_r_chk_warn (__fd, __buf, __buflen, __builtin_object_size (__buf, 2 > 1));
    }
  return __ptsname_r_alias (__fd, __buf, __buflen);
}


extern int __wctomb_chk (char *__s, wchar_t __wchar, size_t __buflen)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern int __wctomb_alias (char *__s, wchar_t __wchar) __asm__ ("" "wctomb") __attribute__ ((__nothrow__ , __leaf__))
              __attribute__ ((__warn_unused_result__));

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) int
__attribute__ ((__nothrow__ , __leaf__)) wctomb (char *__s, wchar_t __wchar)
{







  if (__builtin_object_size (__s, 2 > 1) != (size_t) -1 && 16 > __builtin_object_size (__s, 2 > 1))
    return __wctomb_chk (__s, __wchar, __builtin_object_size (__s, 2 > 1));
  return __wctomb_alias (__s, __wchar);
}


extern size_t __mbstowcs_chk (wchar_t *__restrict __dst,
         const char *__restrict __src,
         size_t __len, size_t __dstlen) __attribute__ ((__nothrow__ , __leaf__));
extern size_t __mbstowcs_alias (wchar_t *__restrict __dst, const char *__restrict __src, size_t __len) __asm__ ("" "mbstowcs") __attribute__ ((__nothrow__ , __leaf__))


                                  ;
extern size_t __mbstowcs_chk_warn (wchar_t *__restrict __dst, const char *__restrict __src, size_t __len, size_t __dstlen) __asm__ ("" "__mbstowcs_chk") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__((__warning__ ("mbstowcs called with dst buffer smaller than len " "* sizeof (wchar_t)")))
                        ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) size_t
__attribute__ ((__nothrow__ , __leaf__)) mbstowcs (wchar_t *__restrict __dst, const char *__restrict __src, size_t __len)

{
  if (__builtin_object_size (__dst, 2 > 1) != (size_t) -1)
    {
      if (!__builtin_constant_p (__len))
 return __mbstowcs_chk (__dst, __src, __len,
          __builtin_object_size (__dst, 2 > 1) / sizeof (wchar_t));

      if (__len > __builtin_object_size (__dst, 2 > 1) / sizeof (wchar_t))
 return __mbstowcs_chk_warn (__dst, __src, __len,
         __builtin_object_size (__dst, 2 > 1) / sizeof (wchar_t));
    }
  return __mbstowcs_alias (__dst, __src, __len);
}


extern size_t __wcstombs_chk (char *__restrict __dst,
         const wchar_t *__restrict __src,
         size_t __len, size_t __dstlen) __attribute__ ((__nothrow__ , __leaf__));
extern size_t __wcstombs_alias (char *__restrict __dst, const wchar_t *__restrict __src, size_t __len) __asm__ ("" "wcstombs") __attribute__ ((__nothrow__ , __leaf__))


                                  ;
extern size_t __wcstombs_chk_warn (char *__restrict __dst, const wchar_t *__restrict __src, size_t __len, size_t __dstlen) __asm__ ("" "__wcstombs_chk") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__((__warning__ ("wcstombs called with dst buffer smaller than len")));

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) size_t
__attribute__ ((__nothrow__ , __leaf__)) wcstombs (char *__restrict __dst, const wchar_t *__restrict __src, size_t __len)

{
  if (__builtin_object_size (__dst, 2 > 1) != (size_t) -1)
    {
      if (!__builtin_constant_p (__len))
 return __wcstombs_chk (__dst, __src, __len, __builtin_object_size (__dst, 2 > 1));
      if (__len > __builtin_object_size (__dst, 2 > 1))
 return __wcstombs_chk_warn (__dst, __src, __len, __builtin_object_size (__dst, 2 > 1));
    }
  return __wcstombs_alias (__dst, __src, __len);
}
# 1018 "/usr/include/stdlib.h" 2 3 4






# 33 "/usr/include/bsd/stdlib.h" 2 3 4






# 1 "/usr/include/bsd/libutil.h" 1 3 4
# 45 "/usr/include/bsd/libutil.h" 3 4
# 1 "/usr/include/bsd/sys/cdefs.h" 1 3 4
# 46 "/usr/include/bsd/libutil.h" 2 3 4


# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stdint.h" 1 3 4
# 9 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stdint.h" 3 4
# 1 "/usr/include/stdint.h" 1 3 4
# 26 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 27 "/usr/include/stdint.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/wchar.h" 1 3 4
# 29 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 30 "/usr/include/stdint.h" 2 3 4







# 1 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h" 3 4
typedef __uint8_t uint8_t;
typedef __uint16_t uint16_t;
typedef __uint32_t uint32_t;
typedef __uint64_t uint64_t;
# 38 "/usr/include/stdint.h" 2 3 4





typedef __int_least8_t int_least8_t;
typedef __int_least16_t int_least16_t;
typedef __int_least32_t int_least32_t;
typedef __int_least64_t int_least64_t;


typedef __uint_least8_t uint_least8_t;
typedef __uint_least16_t uint_least16_t;
typedef __uint_least32_t uint_least32_t;
typedef __uint_least64_t uint_least64_t;





typedef signed char int_fast8_t;

typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
# 71 "/usr/include/stdint.h" 3 4
typedef unsigned char uint_fast8_t;

typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
# 87 "/usr/include/stdint.h" 3 4
typedef long int intptr_t;


typedef unsigned long int uintptr_t;
# 101 "/usr/include/stdint.h" 3 4
typedef __intmax_t intmax_t;
typedef __uintmax_t uintmax_t;
# 10 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stdint.h" 2 3 4
# 49 "/usr/include/bsd/libutil.h" 2 3 4
# 1 "/usr/include/stdio.h" 1 3 4
# 27 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 28 "/usr/include/stdio.h" 2 3 4





# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h" 1 3 4
# 34 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 37 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h" 1 3 4




# 1 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h" 1 3 4
# 13 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h" 3 4
typedef struct
{
  int __count;
  union
  {
    unsigned int __wch;
    char __wchb[4];
  } __value;
} __mbstate_t;
# 6 "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h" 2 3 4




typedef struct _G_fpos_t
{
  __off_t __pos;
  __mbstate_t __state;
} __fpos_t;
# 40 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/__fpos64_t.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/bits/types/__fpos64_t.h" 3 4
typedef struct _G_fpos64_t
{
  __off64_t __pos;
  __mbstate_t __state;
} __fpos64_t;
# 41 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h" 1 3 4



struct _IO_FILE;
typedef struct _IO_FILE __FILE;
# 42 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h" 1 3 4



struct _IO_FILE;


typedef struct _IO_FILE FILE;
# 43 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h" 1 3 4
# 35 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h" 3 4
struct _IO_FILE;
struct _IO_marker;
struct _IO_codecvt;
struct _IO_wide_data;




typedef void _IO_lock_t;





struct _IO_FILE
{
  int _flags;


  char *_IO_read_ptr;
  char *_IO_read_end;
  char *_IO_read_base;
  char *_IO_write_base;
  char *_IO_write_ptr;
  char *_IO_write_end;
  char *_IO_buf_base;
  char *_IO_buf_end;


  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;
  int _flags2;
  __off_t _old_offset;


  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];

  _IO_lock_t *_lock;







  __off64_t _offset;

  struct _IO_codecvt *_codecvt;
  struct _IO_wide_data *_wide_data;
  struct _IO_FILE *_freeres_list;
  void *_freeres_buf;
  size_t __pad5;
  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];
};
# 44 "/usr/include/stdio.h" 2 3 4
# 52 "/usr/include/stdio.h" 3 4
typedef __gnuc_va_list va_list;
# 84 "/usr/include/stdio.h" 3 4
typedef __fpos_t fpos_t;
# 133 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h" 1 3 4
# 134 "/usr/include/stdio.h" 2 3 4



extern FILE *stdin;
extern FILE *stdout;
extern FILE *stderr;






extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));

extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));



extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) __attribute__ ((__nothrow__ , __leaf__));
# 173 "/usr/include/stdio.h" 3 4
extern FILE *tmpfile (void) __attribute__ ((__warn_unused_result__));
# 187 "/usr/include/stdio.h" 3 4
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));




extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
# 204 "/usr/include/stdio.h" 3 4
extern char *tempnam (const char *__dir, const char *__pfx)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));







extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);
# 227 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 246 "/usr/include/stdio.h" 3 4
extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes) __attribute__ ((__warn_unused_result__));




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
# 279 "/usr/include/stdio.h" 3 4
extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
# 292 "/usr/include/stdio.h" 3 4
extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));





extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));




extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ , __leaf__));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));







extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));



extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));
# 379 "/usr/include/stdio.h" 3 4
extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));







extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) __attribute__ ((__warn_unused_result__));




extern int scanf (const char *__restrict __format, ...) __attribute__ ((__warn_unused_result__));

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));






extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf")

                          __attribute__ ((__warn_unused_result__));
extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf")
                         __attribute__ ((__warn_unused_result__));
extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf") __attribute__ ((__nothrow__ , __leaf__))

                      ;
# 432 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) __attribute__ ((__warn_unused_result__));





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) __attribute__ ((__warn_unused_result__));


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));




extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) __attribute__ ((__warn_unused_result__));
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) __attribute__ ((__warn_unused_result__));
extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__ ((__format__ (__scanf__, 2, 0)));
# 485 "/usr/include/stdio.h" 3 4
extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);






extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 510 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);
# 521 "/usr/include/stdio.h" 3 4
extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);
# 537 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);







extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     __attribute__ ((__warn_unused_result__));
# 577 "/usr/include/stdio.h" 3 4
extern char *gets (char *__s) __attribute__ ((__warn_unused_result__)) __attribute__ ((__deprecated__));
# 603 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
                             size_t *__restrict __n, int __delimiter,
                             FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern __ssize_t getdelim (char **__restrict __lineptr,
                           size_t *__restrict __n, int __delimiter,
                           FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));







extern __ssize_t getline (char **__restrict __lineptr,
                          size_t *__restrict __n,
                          FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));







extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);
# 673 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);







extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) __attribute__ ((__warn_unused_result__));




extern void rewind (FILE *__stream);
# 707 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) __attribute__ ((__warn_unused_result__));
# 731 "/usr/include/stdio.h" 3 4
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, const fpos_t *__pos);
# 757 "/usr/include/stdio.h" 3 4
extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));







extern void perror (const char *__s);





# 1 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern const char *const sys_errlist[];
# 782 "/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
# 800 "/usr/include/stdio.h" 3 4
extern FILE *popen (const char *__command, const char *__modes) __attribute__ ((__warn_unused_result__));





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__));
# 840 "/usr/include/stdio.h" 3 4
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
# 858 "/usr/include/stdio.h" 3 4
extern int __uflow (FILE *);
extern int __overflow (FILE *, int);




# 1 "/usr/include/x86_64-linux-gnu/bits/stdio.h" 1 3 4
# 46 "/usr/include/x86_64-linux-gnu/bits/stdio.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) int
getchar (void)
{
  return getc (stdin);
}




extern __inline __attribute__ ((__gnu_inline__)) int
fgetc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}





extern __inline __attribute__ ((__gnu_inline__)) int
getc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}


extern __inline __attribute__ ((__gnu_inline__)) int
getchar_unlocked (void)
{
  return (__builtin_expect (((stdin)->_IO_read_ptr >= (stdin)->_IO_read_end), 0) ? __uflow (stdin) : *(unsigned char *) (stdin)->_IO_read_ptr++);
}




extern __inline __attribute__ ((__gnu_inline__)) int
putchar (int __c)
{
  return putc (__c, stdout);
}




extern __inline __attribute__ ((__gnu_inline__)) int
fputc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}





extern __inline __attribute__ ((__gnu_inline__)) int
putc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}


extern __inline __attribute__ ((__gnu_inline__)) int
putchar_unlocked (int __c)
{
  return (__builtin_expect (((stdout)->_IO_write_ptr >= (stdout)->_IO_write_end), 0) ? __overflow (stdout, (unsigned char) (__c)) : (unsigned char) (*(stdout)->_IO_write_ptr++ = (__c)));
}
# 127 "/usr/include/x86_64-linux-gnu/bits/stdio.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) feof_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x0010) != 0);
}


extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) ferror_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x0020) != 0);
}
# 865 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/stdio2.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/stdio2.h" 3 4
extern int __sprintf_chk (char *__restrict __s, int __flag, size_t __slen,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
extern int __vsprintf_chk (char *__restrict __s, int __flag, size_t __slen,
      const char *__restrict __format,
      __gnuc_va_list __ap) __attribute__ ((__nothrow__ , __leaf__));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) sprintf (char *__restrict __s, const char *__restrict __fmt, ...)
{
  return __builtin___sprintf_chk (__s, 2 - 1,
      __builtin_object_size (__s, 2 > 1), __fmt, __builtin_va_arg_pack ());
}






extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) vsprintf (char *__restrict __s, const char *__restrict __fmt, __gnuc_va_list __ap)

{
  return __builtin___vsprintf_chk (__s, 2 - 1,
       __builtin_object_size (__s, 2 > 1), __fmt, __ap);
}



extern int __snprintf_chk (char *__restrict __s, size_t __n, int __flag,
      size_t __slen, const char *__restrict __format,
      ...) __attribute__ ((__nothrow__ , __leaf__));
extern int __vsnprintf_chk (char *__restrict __s, size_t __n, int __flag,
       size_t __slen, const char *__restrict __format,
       __gnuc_va_list __ap) __attribute__ ((__nothrow__ , __leaf__));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) snprintf (char *__restrict __s, size_t __n, const char *__restrict __fmt, ...)

{
  return __builtin___snprintf_chk (__s, __n, 2 - 1,
       __builtin_object_size (__s, 2 > 1), __fmt, __builtin_va_arg_pack ());
}






extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) vsnprintf (char *__restrict __s, size_t __n, const char *__restrict __fmt, __gnuc_va_list __ap)

{
  return __builtin___vsnprintf_chk (__s, __n, 2 - 1,
        __builtin_object_size (__s, 2 > 1), __fmt, __ap);
}





extern int __fprintf_chk (FILE *__restrict __stream, int __flag,
     const char *__restrict __format, ...);
extern int __printf_chk (int __flag, const char *__restrict __format, ...);
extern int __vfprintf_chk (FILE *__restrict __stream, int __flag,
      const char *__restrict __format, __gnuc_va_list __ap);
extern int __vprintf_chk (int __flag, const char *__restrict __format,
     __gnuc_va_list __ap);


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
fprintf (FILE *__restrict __stream, const char *__restrict __fmt, ...)
{
  return __fprintf_chk (__stream, 2 - 1, __fmt,
   __builtin_va_arg_pack ());
}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
printf (const char *__restrict __fmt, ...)
{
  return __printf_chk (2 - 1, __fmt, __builtin_va_arg_pack ());
}







extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
vprintf (const char *__restrict __fmt, __gnuc_va_list __ap)
{

  return __vfprintf_chk (stdout, 2 - 1, __fmt, __ap);



}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
vfprintf (FILE *__restrict __stream,
   const char *__restrict __fmt, __gnuc_va_list __ap)
{
  return __vfprintf_chk (__stream, 2 - 1, __fmt, __ap);
}


extern int __dprintf_chk (int __fd, int __flag, const char *__restrict __fmt,
     ...) __attribute__ ((__format__ (__printf__, 3, 4)));
extern int __vdprintf_chk (int __fd, int __flag,
      const char *__restrict __fmt, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 3, 0)));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
dprintf (int __fd, const char *__restrict __fmt, ...)
{
  return __dprintf_chk (__fd, 2 - 1, __fmt,
   __builtin_va_arg_pack ());
}





extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
vdprintf (int __fd, const char *__restrict __fmt, __gnuc_va_list __ap)
{
  return __vdprintf_chk (__fd, 2 - 1, __fmt, __ap);
}
# 229 "/usr/include/x86_64-linux-gnu/bits/stdio2.h" 3 4
extern char *__gets_chk (char *__str, size_t) __attribute__ ((__warn_unused_result__));
extern char *__gets_warn (char *__str) __asm__ ("" "gets")
     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("please use fgets or getline instead, gets can't " "specify buffer size")))
                               ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) char *
gets (char *__str)
{
  if (__builtin_object_size (__str, 2 > 1) != (size_t) -1)
    return __gets_chk (__str, __builtin_object_size (__str, 2 > 1));
  return __gets_warn (__str);
}


extern char *__fgets_chk (char *__restrict __s, size_t __size, int __n,
     FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern char *__fgets_alias (char *__restrict __s, int __n, FILE *__restrict __stream) __asm__ ("" "fgets")

                                        __attribute__ ((__warn_unused_result__));
extern char *__fgets_chk_warn (char *__restrict __s, size_t __size, int __n, FILE *__restrict __stream) __asm__ ("" "__fgets_chk")


     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("fgets called with bigger size than length " "of destination buffer")))
                                 ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) char *
fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
{
  if (__builtin_object_size (__s, 2 > 1) != (size_t) -1)
    {
      if (!__builtin_constant_p (__n) || __n <= 0)
 return __fgets_chk (__s, __builtin_object_size (__s, 2 > 1), __n, __stream);

      if ((size_t) __n > __builtin_object_size (__s, 2 > 1))
 return __fgets_chk_warn (__s, __builtin_object_size (__s, 2 > 1), __n, __stream);
    }
  return __fgets_alias (__s, __n, __stream);
}

extern size_t __fread_chk (void *__restrict __ptr, size_t __ptrlen,
      size_t __size, size_t __n,
      FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern size_t __fread_alias (void *__restrict __ptr, size_t __size, size_t __n, FILE *__restrict __stream) __asm__ ("" "fread")


            __attribute__ ((__warn_unused_result__));
extern size_t __fread_chk_warn (void *__restrict __ptr, size_t __ptrlen, size_t __size, size_t __n, FILE *__restrict __stream) __asm__ ("" "__fread_chk")




     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("fread called with bigger size * nmemb than length " "of destination buffer")))
                                 ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) size_t
fread (void *__restrict __ptr, size_t __size, size_t __n,
       FILE *__restrict __stream)
{
  if (__builtin_object_size (__ptr, 0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__size)
   || !__builtin_constant_p (__n)
   || (__size | __n) >= (((size_t) 1) << (8 * sizeof (size_t) / 2)))
 return __fread_chk (__ptr, __builtin_object_size (__ptr, 0), __size, __n, __stream);

      if (__size * __n > __builtin_object_size (__ptr, 0))
 return __fread_chk_warn (__ptr, __builtin_object_size (__ptr, 0), __size, __n, __stream);
    }
  return __fread_alias (__ptr, __size, __n, __stream);
}
# 329 "/usr/include/x86_64-linux-gnu/bits/stdio2.h" 3 4
extern size_t __fread_unlocked_chk (void *__restrict __ptr, size_t __ptrlen,
        size_t __size, size_t __n,
        FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern size_t __fread_unlocked_alias (void *__restrict __ptr, size_t __size, size_t __n, FILE *__restrict __stream) __asm__ ("" "fread_unlocked")


                     __attribute__ ((__warn_unused_result__));
extern size_t __fread_unlocked_chk_warn (void *__restrict __ptr, size_t __ptrlen, size_t __size, size_t __n, FILE *__restrict __stream) __asm__ ("" "__fread_unlocked_chk")




     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("fread_unlocked called with bigger size * nmemb than " "length of destination buffer")))
                                        ;

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) size_t
fread_unlocked (void *__restrict __ptr, size_t __size, size_t __n,
  FILE *__restrict __stream)
{
  if (__builtin_object_size (__ptr, 0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__size)
   || !__builtin_constant_p (__n)
   || (__size | __n) >= (((size_t) 1) << (8 * sizeof (size_t) / 2)))
 return __fread_unlocked_chk (__ptr, __builtin_object_size (__ptr, 0), __size, __n,
         __stream);

      if (__size * __n > __builtin_object_size (__ptr, 0))
 return __fread_unlocked_chk_warn (__ptr, __builtin_object_size (__ptr, 0), __size, __n,
       __stream);
    }


  if (__builtin_constant_p (__size)
      && __builtin_constant_p (__n)
      && (__size | __n) < (((size_t) 1) << (8 * sizeof (size_t) / 2))
      && __size * __n <= 8)
    {
      size_t __cnt = __size * __n;
      char *__cptr = (char *) __ptr;
      if (__cnt == 0)
 return 0;

      for (; __cnt > 0; --__cnt)
 {
   int __c = getc_unlocked (__stream);
   if (__c == (-1))
     break;
   *__cptr++ = __c;
 }
      return (__cptr - (char *) __ptr) / __size;
    }

  return __fread_unlocked_alias (__ptr, __size, __n, __stream);
}
# 868 "/usr/include/stdio.h" 2 3 4






# 50 "/usr/include/bsd/libutil.h" 2 3 4

struct pidfh;


int humanize_number(char *buf, size_t len, int64_t bytes,
    const char *suffix, int scale, int flags);
int expand_number(const char *_buf, uint64_t *_num);

int flopen(const char *_path, int _flags, ...);
int flopenat(int dirfd, const char *path, int flags, ...);

struct pidfh *pidfile_open(const char *path, mode_t mode, pid_t *pidptr);
int pidfile_fileno(const struct pidfh *pfh);
int pidfile_write(struct pidfh *pfh);
int pidfile_close(struct pidfh *pfh);
int pidfile_remove(struct pidfh *pfh);

char *fparseln(FILE *, size_t *, size_t *, const char[3], int);

# 40 "/usr/include/bsd/stdlib.h" 2 3 4
# 48 "/usr/include/bsd/stdlib.h" 3 4
# 1 "/usr/include/bsd/sys/cdefs.h" 1 3 4
# 49 "/usr/include/bsd/stdlib.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/sys/stat.h" 1 3 4
# 99 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/stat.h" 1 3 4
# 46 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
struct stat
  {
    __dev_t st_dev;




    __ino_t st_ino;







    __nlink_t st_nlink;
    __mode_t st_mode;

    __uid_t st_uid;
    __gid_t st_gid;

    int __pad0;

    __dev_t st_rdev;




    __off_t st_size;



    __blksize_t st_blksize;

    __blkcnt_t st_blocks;
# 91 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
# 106 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
    __syscall_slong_t __glibc_reserved[3];
# 115 "/usr/include/x86_64-linux-gnu/bits/stat.h" 3 4
  };
# 102 "/usr/include/x86_64-linux-gnu/sys/stat.h" 2 3 4
# 205 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4
extern int stat (const char *__restrict __file,
   struct stat *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int fstat (int __fd, struct stat *__buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
# 234 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4
extern int fstatat (int __fd, const char *__restrict __file,
      struct stat *__restrict __buf, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
# 259 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4
extern int lstat (const char *__restrict __file,
    struct stat *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
# 280 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4
extern int chmod (const char *__file, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int lchmod (const char *__file, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




extern int fchmod (int __fd, __mode_t __mode) __attribute__ ((__nothrow__ , __leaf__));





extern int fchmodat (int __fd, const char *__file, __mode_t __mode,
       int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) __attribute__ ((__warn_unused_result__));






extern __mode_t umask (__mode_t __mask) __attribute__ ((__nothrow__ , __leaf__));
# 317 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4
extern int mkdir (const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int mkdirat (int __fd, const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));






extern int mknod (const char *__path, __mode_t __mode, __dev_t __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int mknodat (int __fd, const char *__path, __mode_t __mode,
      __dev_t __dev) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));





extern int mkfifo (const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int mkfifoat (int __fd, const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));





extern int utimensat (int __fd, const char *__path,
        const struct timespec __times[2],
        int __flags)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




extern int futimens (int __fd, const struct timespec __times[2]) __attribute__ ((__nothrow__ , __leaf__));
# 395 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4
extern int __fxstat (int __ver, int __fildes, struct stat *__stat_buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));
extern int __xstat (int __ver, const char *__filename,
      struct stat *__stat_buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern int __lxstat (int __ver, const char *__filename,
       struct stat *__stat_buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern int __fxstatat (int __ver, int __fildes, const char *__filename,
         struct stat *__stat_buf, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4)));
# 438 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4
extern int __xmknod (int __ver, const char *__path, __mode_t __mode,
       __dev_t *__dev) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));

extern int __xmknodat (int __ver, int __fd, const char *__path,
         __mode_t __mode, __dev_t *__dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 5)));
# 452 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) stat (const char *__path, struct stat *__statbuf)
{
  return __xstat (1, __path, __statbuf);
}


extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) lstat (const char *__path, struct stat *__statbuf)
{
  return __lxstat (1, __path, __statbuf);
}


extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) fstat (int __fd, struct stat *__statbuf)
{
  return __fxstat (1, __fd, __statbuf);
}


extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) fstatat (int __fd, const char *__filename, struct stat *__statbuf, int __flag)

{
  return __fxstatat (1, __fd, __filename, __statbuf, __flag);
}



extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) mknod (const char *__path, __mode_t __mode, __dev_t __dev)
{
  return __xmknod (0, __path, __mode, &__dev);
}



extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) mknodat (int __fd, const char *__path, __mode_t __mode, __dev_t __dev)

{
  return __xmknodat (0, __fd, __path, __mode, &__dev);
}
# 534 "/usr/include/x86_64-linux-gnu/sys/stat.h" 3 4

# 51 "/usr/include/bsd/stdlib.h" 2 3 4



uint32_t arc4random(void);
void arc4random_stir(void);
void arc4random_addrandom(unsigned char *dat, int datlen);
void arc4random_buf(void *_buf, size_t n);
uint32_t arc4random_uniform(uint32_t upper_bound);

int dehumanize_number(const char *str, int64_t *size);

const char *getprogname(void);
void setprogname(const char *);

int heapsort (void *, size_t, size_t, int (*)(const void *, const void *));
int mergesort(void *base, size_t nmemb, size_t size,
              int (*cmp)(const void *, const void *));
int radixsort(const unsigned char **base, int nmemb,
              const unsigned char *table, unsigned endbyte);
int sradixsort(const unsigned char **base, int nmemb,
               const unsigned char *table, unsigned endbyte);

void *reallocf(void *ptr, size_t size);


void *reallocarray(void *ptr, size_t nmemb, size_t size);


long long strtonum(const char *nptr, long long minval, long long maxval,
                   const char **errstr);

char *getbsize(int *headerlenp, long *blocksizep);

# 5 "sa.c" 2
# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/limits.h" 1 3 4
# 34 "/usr/lib/gcc/x86_64-linux-gnu/9/include/limits.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/syslimits.h" 1 3 4






# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/limits.h" 1 3 4
# 194 "/usr/lib/gcc/x86_64-linux-gnu/9/include/limits.h" 3 4
# 1 "/usr/include/limits.h" 1 3 4
# 26 "/usr/include/limits.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 27 "/usr/include/limits.h" 2 3 4
# 183 "/usr/include/limits.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 2 3 4
# 161 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 1 3 4
# 38 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 3 4
# 1 "/usr/include/linux/limits.h" 1 3 4
# 39 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 2 3 4
# 162 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 2 3 4
# 184 "/usr/include/limits.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/posix2_lim.h" 1 3 4
# 188 "/usr/include/limits.h" 2 3 4
# 195 "/usr/lib/gcc/x86_64-linux-gnu/9/include/limits.h" 2 3 4
# 8 "/usr/lib/gcc/x86_64-linux-gnu/9/include/syslimits.h" 2 3 4
# 35 "/usr/lib/gcc/x86_64-linux-gnu/9/include/limits.h" 2 3 4
# 6 "sa.c" 2
# 1 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cplex.h" 1
# 17 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cplex.h"
# 1 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cpxconst.h" 1
# 63 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cpxconst.h"
    
# 63 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cpxconst.h"
   typedef signed char CPXBYTE;





    typedef int CPXINT;
# 78 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cpxconst.h"
       typedef long long CPXLONG;






    typedef short CPXSHORT;
# 134 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cpxconst.h"
typedef CPXLONG CPXSIZE;
# 146 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cpxconst.h"
       typedef unsigned long long CPXULONG;
# 165 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cpxconst.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/limits.h" 1 3 4
# 166 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cpxconst.h" 2
# 175 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cpxconst.h"
typedef int CPXBYTE_TEST[sizeof(CPXBYTE) == 1 ? 1 : -1];
typedef int CPXSHORT_TEST[sizeof(CPXSHORT) == 2 ? 1 : -1];
typedef int CPXINT_TEST[sizeof(CPXINT) == 4 ? 1 : -1];
typedef int CPXLONG_TEST[sizeof(CPXLONG) == 8 ? 1 : -1];
typedef int CPXULONG_TEST[sizeof(CPXULONG) == 8 ? 1 : -1];





typedef int CPXSIZE_BITS_TEST[sizeof(CPXSIZE) == sizeof(size_t) ? 1 : -1];
# 292 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cpxconst.h"
struct cpxenv;
typedef struct cpxenv *CPXENVptr;
typedef struct cpxenv const *CPXCENVptr;

struct cpxchannel;
typedef struct cpxchannel *CPXCHANNELptr;

struct paramset;
typedef struct paramset *CPXPARAMSETptr;
typedef struct paramset const *CPXCPARAMSETptr;

struct cpxlp;
typedef struct cpxlp *CPXLPptr;

typedef const struct cpxlp *CPXCLPptr;


struct cpxnet;
typedef struct cpxnet *CPXNETptr;

typedef const struct cpxnet *CPXCNETptr;


typedef char *CPXCHARptr;
typedef const char *CPXCCHARptr;
typedef void *CPXVOIDptr;
# 385 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cpxconst.h"
struct cpxiodevice {
   int ( *cpxiodev_eof)(struct cpxiodevice *dev);
   int ( *cpxiodev_error)(struct cpxiodevice *dev);
   int ( *cpxiodev_rewind)(struct cpxiodevice *dev);
   int ( *cpxiodev_flush)(struct cpxiodevice *dev);
   int ( *cpxiodev_close)(struct cpxiodevice *dev);
   int ( *cpxiodev_putc)(int c, struct cpxiodevice *dev);
   int ( *cpxiodev_puts)(const char *s, struct cpxiodevice *dev);
   size_t ( *cpxiodev_read)(void *ptr, size_t size, struct cpxiodevice *dev);
   size_t ( *cpxiodev_write)(const void *ptr, size_t size, struct cpxiodevice *dev);
};
typedef struct cpxiodevice CPXIODEVICE, *CPXIODEVICEptr;
# 723 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cpxconst.h"
typedef const char * CPXNAMEFUNCTION(void *, CPXLONG, char *);
# 2220 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cpxconst.h"
typedef enum {
   CPXCALLBACKINFO_THREADID,
   CPXCALLBACKINFO_NODECOUNT,
   CPXCALLBACKINFO_ITCOUNT,
   CPXCALLBACKINFO_BEST_SOL,
   CPXCALLBACKINFO_BEST_BND,
   CPXCALLBACKINFO_THREADS,
   CPXCALLBACKINFO_FEASIBLE,
   CPXCALLBACKINFO_TIME,
   CPXCALLBACKINFO_DETTIME,
   CPXCALLBACKINFO_NODEUID,
   CPXCALLBACKINFO_NODEDEPTH,
   CPXCALLBACKINFO_CANDIDATE_SOURCE,
   CPXCALLBACKINFO_RESTARTS,
   CPXCALLBACKINFO_AFTERCUTLOOP,
   CPXCALLBACKINFO_NODESLEFT
} CPXCALLBACKINFO;


typedef enum {
   CPXCALLBACKSOLUTION_NOCHECK = -1,
   CPXCALLBACKSOLUTION_CHECKFEAS,
   CPXCALLBACKSOLUTION_PROPAGATE,
   CPXCALLBACKSOLUTION_SOLVE
} CPXCALLBACKSOLUTIONSTRATEGY;


typedef enum {
   CPXINFO_BYTE,
   CPXINFO_SHORT,
   CPXINFO_INT,
   CPXINFO_LONG,
   CPXINFO_DOUBLE
} CPXINFOTYPE;
# 2691 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cpxconst.h"
typedef struct cpxasynchandle *CPXASYNCptr;


typedef struct cpxcallbackcontext *CPXCALLBACKCONTEXTptr;


typedef int CPXCALLBACKFUNC(CPXCALLBACKCONTEXTptr context, CPXLONG contextid, void *userhandle);


typedef struct cpxasynchandle const *CPXCASYNCptr;


typedef struct cpxdeserializer const *CPXCDESERIALIZERptr;


typedef struct cpxenvgroup const *CPXCENVGROUPptr;


typedef struct messagehandler const *CPXCMESSAGEHANDLERptr;


typedef struct cpxserializer const *CPXCSERIALIZERptr;


typedef struct cpxdeserializer *CPXDESERIALIZERptr;


typedef struct cpxenvgroup *CPXENVGROUPptr;


typedef void ( CPXINFOHANDLER) (CPXENVptr env, CPXINFOTYPE type,
                                        int tag, CPXLONG elems,
     void const *data, void *handle);


typedef struct messagehandler *CPXMESSAGEHANDLERptr;


typedef int CPXMODELASSTCALLBACKFUNC(int issueid, const char *message, void *userhandle);


typedef struct cpxserializer *CPXSERIALIZERptr;


typedef int ( CPXUSERFUNCTION) (CPXENVptr env, int id,
                                         CPXLONG insize, void const *indata,
                                         CPXLONG maxout, CPXLONG *outsize_p,
                                         void *outdata, void *handle);
# 2762 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cpxconst.h"
struct cpxasynchandle;


struct cpxdeserializer {
   int ( *getbyte) (CPXDESERIALIZERptr deser, CPXBYTE *b);
   int ( *getshort) (CPXDESERIALIZERptr deser, CPXSHORT *s);
   int ( *getint) (CPXDESERIALIZERptr deser, CPXINT *i);
   int ( *getlong) (CPXDESERIALIZERptr deser, CPXLONG *l);
   int ( *getfloat) (CPXDESERIALIZERptr deser, float *f);
   int ( *getdouble) (CPXDESERIALIZERptr deser, double *d);
   int ( *getbytes) (CPXDESERIALIZERptr deser, CPXLONG cnt, CPXBYTE *b);
   int ( *getshorts) (CPXDESERIALIZERptr deser, CPXLONG cnt, CPXSHORT *s);
   int ( *getints) (CPXDESERIALIZERptr deser, CPXLONG cnt, CPXINT *i);
   int ( *getlongs) (CPXDESERIALIZERptr deser, CPXLONG cnt, CPXLONG *l);
   int ( *getfloats) (CPXDESERIALIZERptr deser, CPXLONG cnt, float *d);
   int ( *getdoubles) (CPXDESERIALIZERptr deser, CPXLONG cnt, double *d);
};


struct cpxserializer {
   int ( *addbyte) (CPXSERIALIZERptr ser, CPXBYTE b);
   int ( *addshort) (CPXSERIALIZERptr ser, CPXSHORT s);
   int ( *addint) (CPXSERIALIZERptr ser, CPXINT i);
   int ( *addlong) (CPXSERIALIZERptr ser, CPXLONG l);
   int ( *addfloat) (CPXSERIALIZERptr ser, float f);
   int ( *adddouble) (CPXSERIALIZERptr ser, double d);
   int ( *addbytes) (CPXSERIALIZERptr ser, CPXLONG cnt, CPXBYTE const *b);
   int ( *addshorts) (CPXSERIALIZERptr ser, CPXLONG cnt, CPXSHORT const *s);
   int ( *addints) (CPXSERIALIZERptr ser, CPXLONG cnt, CPXINT const *i);
   int ( *addlongs) (CPXSERIALIZERptr ser, CPXLONG cnt, CPXLONG const *l);
   int ( *addfloats) (CPXSERIALIZERptr ser, CPXLONG cnt, float const *d);
   int ( *adddoubles) (CPXSERIALIZERptr ser, CPXLONG cnt, double const *d);
};


struct messagehandler;
# 18 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cplex.h" 2
# 27 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cplex.h"

int
   CPXaddcols (CPXCENVptr env, CPXLPptr lp, int ccnt, int nzcnt,
               double const *obj, int const *cmatbeg,
               int const *cmatind, double const *cmatval,
               double const *lb, double const *ub, char **colname);



int
   CPXaddfuncdest (CPXCENVptr env, CPXCHANNELptr channel, void *handle,
                   void( *msgfunction)(void *, const char *));



int
   CPXaddpwl (CPXCENVptr env, CPXLPptr lp, int vary, int varx,
              double preslope, double postslope, int nbreaks,
              double const *breakx, double const *breaky,
              char const *pwlname);



int
   CPXaddrows (CPXCENVptr env, CPXLPptr lp, int ccnt, int rcnt,
               int nzcnt, double const *rhs, char const *sense,
               int const *rmatbeg, int const *rmatind,
               double const *rmatval, char **colname, char **rowname);



int
   CPXbasicpresolve (CPXCENVptr env, CPXLPptr lp, double *redlb,
                     double *redub, int *rstat);



int
   CPXbinvacol (CPXCENVptr env, CPXCLPptr lp, int j, double *x);



int
   CPXbinvarow (CPXCENVptr env, CPXCLPptr lp, int i, double *z);



int
   CPXbinvcol (CPXCENVptr env, CPXCLPptr lp, int j, double *x);



int
   CPXbinvrow (CPXCENVptr env, CPXCLPptr lp, int i, double *y);



int
   CPXboundsa (CPXCENVptr env, CPXCLPptr lp, int begin, int end,
               double *lblower, double *lbupper, double *ublower,
               double *ubupper);



int
   CPXbtran (CPXCENVptr env, CPXCLPptr lp, double *y);



void
   CPXcallbackabort (CPXCALLBACKCONTEXTptr context);



int
   CPXcallbackaddusercuts (CPXCALLBACKCONTEXTptr context, int rcnt,
                           int nzcnt, double const *rhs,
                           char const *sense, int const *rmatbeg,
                           int const *rmatind, double const *rmatval,
                           int const *purgeable, int const *local);



int
   CPXcallbackcandidateispoint (CPXCALLBACKCONTEXTptr context,
                                int *ispoint_p);



int
   CPXcallbackcandidateisray (CPXCALLBACKCONTEXTptr context,
                              int *isray_p);



int
   CPXcallbackexitcutloop (CPXCALLBACKCONTEXTptr context);



int
   CPXcallbackgetcandidatepoint (CPXCALLBACKCONTEXTptr context,
                                 double *x, int begin, int end,
                                 double *obj_p);



int
   CPXcallbackgetcandidateray (CPXCALLBACKCONTEXTptr context,
                               double *x, int begin, int end);



int
   CPXcallbackgetfunc (CPXCENVptr env, CPXCLPptr lp,
                       CPXLONG *contextmask_p,
                       CPXCALLBACKFUNC **callback_p,
                       void **cbhandle_p);



int
   CPXcallbackgetincumbent (CPXCALLBACKCONTEXTptr context, double *x,
                            int begin, int end, double *obj_p);



int
   CPXcallbackgetinfodbl (CPXCALLBACKCONTEXTptr context,
                          CPXCALLBACKINFO what, double *data_p);



int
   CPXcallbackgetinfoint (CPXCALLBACKCONTEXTptr context,
                          CPXCALLBACKINFO what, CPXINT *data_p);



int
   CPXcallbackgetinfolong (CPXCALLBACKCONTEXTptr context,
                           CPXCALLBACKINFO what, CPXLONG *data_p);



int
   CPXcallbackgetrelaxationpoint (CPXCALLBACKCONTEXTptr context,
                                  double *x, int begin, int end,
                                  double *obj_p);



int
   CPXcallbackgetrelaxationstatus (CPXCALLBACKCONTEXTptr context,
                                   int *nodelpstat_p, CPXLONG flags);



int
   CPXcallbackmakebranch (CPXCALLBACKCONTEXTptr context, int varcnt,
                          int const *varind, char const *varlu,
                          double const *varbd, int rcnt, int nzcnt,
                          double const *rhs, char const *sense,
                          int const *rmatbeg, int const *rmatind,
                          double const *rmatval, double nodeest,
                          int *seqnum_p);



int
   CPXcallbackpostheursoln (CPXCALLBACKCONTEXTptr context, int cnt,
                            int const *ind, double const *val,
                            double obj,
                            CPXCALLBACKSOLUTIONSTRATEGY strat);



int
   CPXcallbackprunenode (CPXCALLBACKCONTEXTptr context);



int
   CPXcallbackrejectcandidate (CPXCALLBACKCONTEXTptr context, int rcnt,
                               int nzcnt, double const *rhs,
                               char const *sense, int const *rmatbeg,
                               int const *rmatind,
                               double const *rmatval);



int
   CPXcallbackrejectcandidatelocal (CPXCALLBACKCONTEXTptr context,
                                    int rcnt, int nzcnt,
                                    double const *rhs,
                                    char const *sense,
                                    int const *rmatbeg,
                                    int const *rmatind,
                                    double const *rmatval);



int
   CPXcallbacksetfunc (CPXENVptr env, CPXLPptr lp, CPXLONG contextmask,
                       CPXCALLBACKFUNC callback, void *userhandle);



int
   CPXcheckdfeas (CPXCENVptr env, CPXLPptr lp, int *infeas_p);



int
   CPXcheckpfeas (CPXCENVptr env, CPXLPptr lp, int *infeas_p);



int
   CPXchecksoln (CPXCENVptr env, CPXLPptr lp, int *lpstatus_p);



int
   CPXchgbds (CPXCENVptr env, CPXLPptr lp, int cnt, int const *indices,
              char const *lu, double const *bd);



int
   CPXchgcoef (CPXCENVptr env, CPXLPptr lp, int i, int j,
               double newvalue);



int
   CPXchgcoeflist (CPXCENVptr env, CPXLPptr lp, int numcoefs,
                   int const *rowlist, int const *collist,
                   double const *vallist);



int
   CPXchgcolname (CPXCENVptr env, CPXLPptr lp, int cnt,
                  int const *indices, char **newname);



int
   CPXchgname (CPXCENVptr env, CPXLPptr lp, int key, int ij,
               char const *newname_str);



int
   CPXchgobj (CPXCENVptr env, CPXLPptr lp, int cnt, int const *indices,
              double const *values);



int
   CPXchgobjoffset (CPXCENVptr env, CPXLPptr lp, double offset);



int
   CPXchgobjsen (CPXCENVptr env, CPXLPptr lp, int maxormin);



int
   CPXchgprobname (CPXCENVptr env, CPXLPptr lp, char const *probname);



int
   CPXchgprobtype (CPXCENVptr env, CPXLPptr lp, int type);



int
   CPXchgprobtypesolnpool (CPXCENVptr env, CPXLPptr lp, int type,
                           int soln);



int
   CPXchgrhs (CPXCENVptr env, CPXLPptr lp, int cnt, int const *indices,
              double const *values);



int
   CPXchgrngval (CPXCENVptr env, CPXLPptr lp, int cnt,
                 int const *indices, double const *values);



int
   CPXchgrowname (CPXCENVptr env, CPXLPptr lp, int cnt,
                  int const *indices, char **newname);



int
   CPXchgsense (CPXCENVptr env, CPXLPptr lp, int cnt,
                int const *indices, char const *sense);



int
   CPXcleanup (CPXCENVptr env, CPXLPptr lp, double eps);



CPXLPptr
   CPXcloneprob (CPXCENVptr env, CPXCLPptr lp, int *status_p);



int
   CPXcloseCPLEX (CPXENVptr *env_p);



int
   CPXclpwrite (CPXCENVptr env, CPXCLPptr lp, char const *filename_str);



int
   CPXcompletelp (CPXCENVptr env, CPXLPptr lp);



int
   CPXcopybase (CPXCENVptr env, CPXLPptr lp, int const *cstat,
                int const *rstat);



int
   CPXcopybasednorms (CPXCENVptr env, CPXLPptr lp, int const *cstat,
                      int const *rstat, double const *dnorm);



int
   CPXcopydnorms (CPXCENVptr env, CPXLPptr lp, double const *norm,
                  int const *head, int len);



int
   CPXcopylp (CPXCENVptr env, CPXLPptr lp, int numcols, int numrows,
              int objsense, double const *objective, double const *rhs,
              char const *sense, int const *matbeg, int const *matcnt,
              int const *matind, double const *matval,
              double const *lb, double const *ub, double const *rngval);



int
   CPXcopylpwnames (CPXCENVptr env, CPXLPptr lp, int numcols,
                    int numrows, int objsense, double const *objective,
                    double const *rhs, char const *sense,
                    int const *matbeg, int const *matcnt,
                    int const *matind, double const *matval,
                    double const *lb, double const *ub,
                    double const *rngval, char **colname,
                    char **rowname);



int
   CPXcopynettolp (CPXCENVptr env, CPXLPptr lp, CPXCNETptr net);



int
   CPXcopyobjname (CPXCENVptr env, CPXLPptr lp,
                   char const *objname_str);



int
   CPXcopypnorms (CPXCENVptr env, CPXLPptr lp, double const *cnorm,
                  double const *rnorm, int len);



int
   CPXcopyprotected (CPXCENVptr env, CPXLPptr lp, int cnt,
                     int const *indices);



int
   CPXcopystart (CPXCENVptr env, CPXLPptr lp, int const *cstat,
                 int const *rstat, double const *cprim,
                 double const *rprim, double const *cdual,
                 double const *rdual);



CPXLPptr
   CPXcreateprob (CPXCENVptr env, int *status_p,
                  char const *probname_str);



int
   CPXcrushform (CPXCENVptr env, CPXCLPptr lp, int len, int const *ind,
                 double const *val, int *plen_p, double *poffset_p,
                 int *pind, double *pval);



int
   CPXcrushpi (CPXCENVptr env, CPXCLPptr lp, double const *pi,
               double *prepi);



int
   CPXcrushx (CPXCENVptr env, CPXCLPptr lp, double const *x,
              double *prex);



int
   CPXdelcols (CPXCENVptr env, CPXLPptr lp, int begin, int end);



int
   CPXdeldblannotation (CPXCENVptr env, CPXLPptr lp, int idx);



int
   CPXdeldblannotations (CPXCENVptr env, CPXLPptr lp, int begin,
                         int end);



int
   CPXdelfuncdest (CPXCENVptr env, CPXCHANNELptr channel, void *handle,
                   void( *msgfunction)(void *, const char *));



int
   CPXdellongannotation (CPXCENVptr env, CPXLPptr lp, int idx);



int
   CPXdellongannotations (CPXCENVptr env, CPXLPptr lp, int begin,
                          int end);



int
   CPXdelnames (CPXCENVptr env, CPXLPptr lp);



int
   CPXdelpwl (CPXCENVptr env, CPXLPptr lp, int begin, int end);



int
   CPXdelrows (CPXCENVptr env, CPXLPptr lp, int begin, int end);



int
   CPXdelsetcols (CPXCENVptr env, CPXLPptr lp, int *delstat);



int
   CPXdelsetpwl (CPXCENVptr env, CPXLPptr lp, int *delstat);



int
   CPXdelsetrows (CPXCENVptr env, CPXLPptr lp, int *delstat);



int
   CPXdeserializercreate (CPXDESERIALIZERptr *deser_p, CPXLONG size,
                          void const *buffer);



void
   CPXdeserializerdestroy (CPXDESERIALIZERptr deser);



CPXLONG
   CPXdeserializerleft (CPXCDESERIALIZERptr deser);



int
   CPXdisconnectchannel (CPXCENVptr env, CPXCHANNELptr channel);



int
   CPXdjfrompi (CPXCENVptr env, CPXCLPptr lp, double const *pi,
                double *dj);



int
   CPXdperwrite (CPXCENVptr env, CPXLPptr lp, char const *filename_str,
                 double epsilon);



int
   CPXdratio (CPXCENVptr env, CPXLPptr lp, int *indices, int cnt,
              double *downratio, double *upratio, int *downenter,
              int *upenter, int *downstatus, int *upstatus);



int
   CPXdualfarkas (CPXCENVptr env, CPXCLPptr lp, double *y,
                  double *proof_p);



int
   CPXdualopt (CPXCENVptr env, CPXLPptr lp);



int
   CPXdualwrite (CPXCENVptr env, CPXCLPptr lp,
                 char const *filename_str, double *objshift_p);



int
   CPXembwrite (CPXCENVptr env, CPXLPptr lp, char const *filename_str);



int
   CPXfeasopt (CPXCENVptr env, CPXLPptr lp, double const *rhs,
               double const *rng, double const *lb, double const *ub);



int
   CPXfeasoptext (CPXCENVptr env, CPXLPptr lp, int grpcnt, int concnt,
                  double const *grppref, int const *grpbeg,
                  int const *grpind, char const *grptype);



void
   CPXfinalize (void);



int
   CPXflushchannel (CPXCENVptr env, CPXCHANNELptr channel);



int
   CPXflushstdchannels (CPXCENVptr env);



int
   CPXfreepresolve (CPXCENVptr env, CPXLPptr lp);



int
   CPXfreeprob (CPXCENVptr env, CPXLPptr *lp_p);



int
   CPXftran (CPXCENVptr env, CPXCLPptr lp, double *x);



int
   CPXgetax (CPXCENVptr env, CPXCLPptr lp, double *x, int begin,
             int end);



int
   CPXgetbaritcnt (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetbase (CPXCENVptr env, CPXCLPptr lp, int *cstat, int *rstat);



int
   CPXgetbasednorms (CPXCENVptr env, CPXCLPptr lp, int *cstat,
                     int *rstat, double *dnorm);



int
   CPXgetbhead (CPXCENVptr env, CPXCLPptr lp, int *head, double *x);



int
   CPXgetcallbackinfo (CPXCENVptr env, void *cbdata, int wherefrom,
                       int whichinfo, void *result_p);



int
   CPXgetchannels (CPXCENVptr env, CPXCHANNELptr *cpxresults_p,
                   CPXCHANNELptr *cpxwarning_p,
                   CPXCHANNELptr *cpxerror_p, CPXCHANNELptr *cpxlog_p);



int
   CPXgetchgparam (CPXCENVptr env, int *cnt_p, int *paramnum,
                   int pspace, int *surplus_p);



int
   CPXgetcoef (CPXCENVptr env, CPXCLPptr lp, int i, int j,
               double *coef_p);



int
   CPXgetcolindex (CPXCENVptr env, CPXCLPptr lp, char const *lname_str,
                   int *index_p);



int
   CPXgetcolinfeas (CPXCENVptr env, CPXCLPptr lp, double const *x,
                    double *infeasout, int begin, int end);



int
   CPXgetcolname (CPXCENVptr env, CPXCLPptr lp, char **name,
                  char *namestore, int storespace, int *surplus_p,
                  int begin, int end);



int
   CPXgetcols (CPXCENVptr env, CPXCLPptr lp, int *nzcnt_p,
               int *cmatbeg, int *cmatind, double *cmatval,
               int cmatspace, int *surplus_p, int begin, int end);



int
   CPXgetconflict (CPXCENVptr env, CPXCLPptr lp, int *confstat_p,
                   int *rowind, int *rowbdstat, int *confnumrows_p,
                   int *colind, int *colbdstat, int *confnumcols_p);



int
   CPXgetconflictext (CPXCENVptr env, CPXCLPptr lp, int *grpstat,
                      int beg, int end);



int
   CPXgetconflictgroups (CPXCENVptr env, CPXCLPptr lp, int *concnt_p,
                         double *grppref, int *grpbeg, int *grpind,
                         char *grptype, int grpspace, int *surplus_p,
                         int begin, int end);



int
   CPXgetconflictnumgroups (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetconflictnumpasses (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetcrossdexchcnt (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetcrossdpushcnt (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetcrosspexchcnt (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetcrossppushcnt (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetdblannotationdefval (CPXCENVptr env, CPXCLPptr lp, int idx,
                              double *defval_p);



int
   CPXgetdblannotationindex (CPXCENVptr env, CPXCLPptr lp,
                             char const *annotationname_str,
                             int *index_p);



int
   CPXgetdblannotationname (CPXCENVptr env, CPXCLPptr lp, int idx,
                            char *buf_str, int bufspace,
                            int *surplus_p);



int
   CPXgetdblannotations (CPXCENVptr env, CPXCLPptr lp, int idx,
                         int objtype, double *annotation, int begin,
                         int end);



int
   CPXgetdblparam (CPXCENVptr env, int whichparam, double *value_p);



int
   CPXgetdblquality (CPXCENVptr env, CPXCLPptr lp, double *quality_p,
                     int what);



int
   CPXgetdettime (CPXCENVptr env, double *dettimestamp_p);



int
   CPXgetdj (CPXCENVptr env, CPXCLPptr lp, double *dj, int begin,
             int end);



int
   CPXgetdnorms (CPXCENVptr env, CPXCLPptr lp, double *norm, int *head,
                 int *len_p);



int
   CPXgetdsbcnt (CPXCENVptr env, CPXCLPptr lp);



CPXCCHARptr
   CPXgeterrorstring (CPXCENVptr env, int errcode, char *buffer_str);



int
   CPXgetgrad (CPXCENVptr env, CPXCLPptr lp, int j, int *head,
               double *y);



int
   CPXgetijdiv (CPXCENVptr env, CPXCLPptr lp, int *idiv_p, int *jdiv_p);



int
   CPXgetijrow (CPXCENVptr env, CPXCLPptr lp, int i, int j, int *row_p);



int
   CPXgetintparam (CPXCENVptr env, int whichparam, CPXINT *value_p);



int
   CPXgetintquality (CPXCENVptr env, CPXCLPptr lp, int *quality_p,
                     int what);



int
   CPXgetitcnt (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetlb (CPXCENVptr env, CPXCLPptr lp, double *lb, int begin,
             int end);



int
   CPXgetlogfilename (CPXCENVptr env, char *buf_str, int bufspace,
                      int *surplus_p);



int
   CPXgetlongannotationdefval (CPXCENVptr env, CPXCLPptr lp, int idx,
                               CPXLONG *defval_p);



int
   CPXgetlongannotationindex (CPXCENVptr env, CPXCLPptr lp,
                              char const *annotationname_str,
                              int *index_p);



int
   CPXgetlongannotationname (CPXCENVptr env, CPXCLPptr lp, int idx,
                             char *buf_str, int bufspace,
                             int *surplus_p);



int
   CPXgetlongannotations (CPXCENVptr env, CPXCLPptr lp, int idx,
                          int objtype, CPXLONG *annotation, int begin,
                          int end);



int
   CPXgetlongparam (CPXCENVptr env, int whichparam, CPXLONG *value_p);



int
   CPXgetlpcallbackfunc (CPXCENVptr env,
                         int( **callback_p)(CPXCENVptr, void *, int, void *),
                         void **cbhandle_p);



int
   CPXgetmethod (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnetcallbackfunc (CPXCENVptr env,
                          int( **callback_p)(CPXCENVptr, void *, int, void *),
                          void **cbhandle_p);



int
   CPXgetnumcols (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnumcores (CPXCENVptr env, int *numcores_p);



int
   CPXgetnumdblannotations (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnumlongannotations (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnumnz (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnumobjs (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnumpwl (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnumrows (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetobj (CPXCENVptr env, CPXCLPptr lp, double *obj, int begin,
              int end);



int
   CPXgetobjname (CPXCENVptr env, CPXCLPptr lp, char *buf_str,
                  int bufspace, int *surplus_p);



int
   CPXgetobjoffset (CPXCENVptr env, CPXCLPptr lp, double *objoffset_p);



int
   CPXgetobjsen (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetobjval (CPXCENVptr env, CPXCLPptr lp, double *objval_p);



int
   CPXgetparamhiername (CPXCENVptr env, int whichparam, char *name_str);



int
   CPXgetparamname (CPXCENVptr env, int whichparam, char *name_str);



int
   CPXgetparamnum (CPXCENVptr env, char const *name_str,
                   int *whichparam_p);



int
   CPXgetparamtype (CPXCENVptr env, int whichparam, int *paramtype);



int
   CPXgetphase1cnt (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetpi (CPXCENVptr env, CPXCLPptr lp, double *pi, int begin,
             int end);



int
   CPXgetpnorms (CPXCENVptr env, CPXCLPptr lp, double *cnorm,
                 double *rnorm, int *len_p);



int
   CPXgetprestat (CPXCENVptr env, CPXCLPptr lp, int *prestat_p,
                  int *pcstat, int *prstat, int *ocstat, int *orstat);



int
   CPXgetprobname (CPXCENVptr env, CPXCLPptr lp, char *buf_str,
                   int bufspace, int *surplus_p);



int
   CPXgetprobtype (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetprotected (CPXCENVptr env, CPXCLPptr lp, int *cnt_p,
                    int *indices, int pspace, int *surplus_p);



int
   CPXgetpsbcnt (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetpwl (CPXCENVptr env, CPXCLPptr lp, int pwlindex, int *vary_p,
              int *varx_p, double *preslope_p, double *postslope_p,
              int *nbreaks_p, double *breakx, double *breaky,
              int breakspace, int *surplus_p);



int
   CPXgetpwlindex (CPXCENVptr env, CPXCLPptr lp, char const *lname_str,
                   int *index_p);



int
   CPXgetpwlname (CPXCENVptr env, CPXCLPptr lp, char *buf_str,
                  int bufspace, int *surplus_p, int which);



int
   CPXgetray (CPXCENVptr env, CPXCLPptr lp, double *z);



int
   CPXgetredlp (CPXCENVptr env, CPXCLPptr lp, CPXCLPptr *redlp_p);



int
   CPXgetrhs (CPXCENVptr env, CPXCLPptr lp, double *rhs, int begin,
              int end);



int
   CPXgetrngval (CPXCENVptr env, CPXCLPptr lp, double *rngval,
                 int begin, int end);



int
   CPXgetrowindex (CPXCENVptr env, CPXCLPptr lp, char const *lname_str,
                   int *index_p);



int
   CPXgetrowinfeas (CPXCENVptr env, CPXCLPptr lp, double const *x,
                    double *infeasout, int begin, int end);



int
   CPXgetrowname (CPXCENVptr env, CPXCLPptr lp, char **name,
                  char *namestore, int storespace, int *surplus_p,
                  int begin, int end);



int
   CPXgetrows (CPXCENVptr env, CPXCLPptr lp, int *nzcnt_p,
               int *rmatbeg, int *rmatind, double *rmatval,
               int rmatspace, int *surplus_p, int begin, int end);



int
   CPXgetsense (CPXCENVptr env, CPXCLPptr lp, char *sense, int begin,
                int end);



int
   CPXgetsiftitcnt (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetsiftphase1cnt (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetslack (CPXCENVptr env, CPXCLPptr lp, double *slack, int begin,
                int end);



int
   CPXgetsolnpooldblquality (CPXCENVptr env, CPXCLPptr lp, int soln,
                             double *quality_p, int what);



int
   CPXgetsolnpoolintquality (CPXCENVptr env, CPXCLPptr lp, int soln,
                             int *quality_p, int what);



int
   CPXgetstat (CPXCENVptr env, CPXCLPptr lp);



CPXCHARptr
   CPXgetstatstring (CPXCENVptr env, int statind, char *buffer_str);



int
   CPXgetstrparam (CPXCENVptr env, int whichparam, char *value_str);



int
   CPXgettime (CPXCENVptr env, double *timestamp_p);



int
   CPXgettuningcallbackfunc (CPXCENVptr env,
                             int( **callback_p)(CPXCENVptr, void *, int, void *),
                             void **cbhandle_p);



int
   CPXgetub (CPXCENVptr env, CPXCLPptr lp, double *ub, int begin,
             int end);



int
   CPXgetweight (CPXCENVptr env, CPXCLPptr lp, int rcnt,
                 int const *rmatbeg, int const *rmatind,
                 double const *rmatval, double *weight, int dpriind);



int
   CPXgetx (CPXCENVptr env, CPXCLPptr lp, double *x, int begin,
            int end);



int
   CPXhybnetopt (CPXCENVptr env, CPXLPptr lp, int method);



int
   CPXinfodblparam (CPXCENVptr env, int whichparam, double *defvalue_p,
                    double *minvalue_p, double *maxvalue_p);



int
   CPXinfointparam (CPXCENVptr env, int whichparam, CPXINT *defvalue_p,
                    CPXINT *minvalue_p, CPXINT *maxvalue_p);



int
   CPXinfolongparam (CPXCENVptr env, int whichparam,
                     CPXLONG *defvalue_p, CPXLONG *minvalue_p,
                     CPXLONG *maxvalue_p);



int
   CPXinfostrparam (CPXCENVptr env, int whichparam, char *defvalue_str);



void
   CPXinitialize (void);



int
   CPXkilldnorms (CPXLPptr lp);



int
   CPXkillpnorms (CPXLPptr lp);



int
   CPXlpopt (CPXCENVptr env, CPXLPptr lp);



int
   CPXmbasewrite (CPXCENVptr env, CPXCLPptr lp,
                  char const *filename_str);



int
   CPXmdleave (CPXCENVptr env, CPXLPptr lp, int const *indices,
               int cnt, double *downratio, double *upratio);



int
   CPXmodelasstcallbackgetfunc (CPXCENVptr env, CPXCLPptr lp,
                                CPXMODELASSTCALLBACKFUNC **callback_p,
                                void **cbhandle_p);



int
   CPXmodelasstcallbacksetfunc (CPXENVptr env, CPXLPptr lp,
                                CPXMODELASSTCALLBACKFUNC callback,
                                void *userhandle);



int
   CPXmsgstr (CPXCHANNELptr channel, char const *msg_str);



int
   CPXmultiobjchgattribs (CPXCENVptr env, CPXLPptr lp, int objind,
                          double offset, double weight, int priority,
                          double abstol, double reltol,
                          char const *name);




int
   CPXmultiobjgetdblinfo (CPXCENVptr env, CPXCLPptr lp, int subprob,
                          double *info_p, int what);




int
   CPXmultiobjgetindex (CPXCENVptr env, CPXCLPptr lp, char const *name,
                        int *index_p);



int
   CPXmultiobjgetintinfo (CPXCENVptr env, CPXCLPptr lp, int subprob,
                          int *info_p, int what);



int
   CPXmultiobjgetlonginfo (CPXCENVptr env, CPXCLPptr lp, int subprob,
                           CPXLONG *info_p, int what);



int
   CPXmultiobjgetname (CPXCENVptr env, CPXCLPptr lp, int objind,
                       char *buf_str, int bufspace, int *surplus_p);



int
   CPXmultiobjgetnumsolves (CPXCENVptr env, CPXCLPptr lp);



int
   CPXmultiobjgetobj (CPXCENVptr env, CPXCLPptr lp, int n,
                      double *coeffs, int begin, int end,
                      double *offset_p, double *weight_p,
                      int *priority_p, double *abstol_p,
                      double *reltol_p);



int
   CPXmultiobjgetobjval (CPXCENVptr env, CPXCLPptr lp, int n,
                         double *objval_p);



int
   CPXmultiobjgetobjvalbypriority (CPXCENVptr env, CPXCLPptr lp,
                                   int priority, double *objval_p);



int
   CPXmultiobjopt (CPXCENVptr env, CPXLPptr lp,
                   CPXCPARAMSETptr const *paramsets);



int
   CPXmultiobjsetobj (CPXCENVptr env, CPXLPptr lp, int n, int objnz,
                      int const *objind, double const *objval,
                      double offset, double weight, int priority,
                      double abstol, double reltol,
                      char const *objname);



int
   CPXNETextract (CPXCENVptr env, CPXNETptr net, CPXCLPptr lp,
                  int *colmap, int *rowmap);



int
   CPXnewcols (CPXCENVptr env, CPXLPptr lp, int ccnt,
               double const *obj, double const *lb, double const *ub,
               char const *xctype, char **colname);



int
   CPXnewdblannotation (CPXCENVptr env, CPXLPptr lp,
                        char const *annotationname_str, double defval);



int
   CPXnewlongannotation (CPXCENVptr env, CPXLPptr lp,
                         char const *annotationname_str,
                         CPXLONG defval);



int
   CPXnewrows (CPXCENVptr env, CPXLPptr lp, int rcnt,
               double const *rhs, char const *sense,
               double const *rngval, char **rowname);



int
   CPXobjsa (CPXCENVptr env, CPXCLPptr lp, int begin, int end,
             double *lower, double *upper);



CPXENVptr
   CPXopenCPLEX (int *status_p);



int
   CPXparamsetadddbl (CPXCENVptr env, CPXPARAMSETptr ps,
                      int whichparam, double newvalue);



int
   CPXparamsetaddint (CPXCENVptr env, CPXPARAMSETptr ps,
                      int whichparam, CPXINT newvalue);



int
   CPXparamsetaddlong (CPXCENVptr env, CPXPARAMSETptr ps,
                       int whichparam, CPXLONG newvalue);



int
   CPXparamsetaddstr (CPXCENVptr env, CPXPARAMSETptr ps,
                      int whichparam, char const *svalue);



int
   CPXparamsetapply (CPXENVptr env, CPXCPARAMSETptr ps);



int
   CPXparamsetcopy (CPXCENVptr targetenv, CPXPARAMSETptr targetps,
                    CPXCPARAMSETptr sourceps);



CPXPARAMSETptr
   CPXparamsetcreate (CPXCENVptr env, int *status_p);



int
   CPXparamsetdel (CPXCENVptr env, CPXPARAMSETptr ps, int whichparam);



int
   CPXparamsetfree (CPXCENVptr env, CPXPARAMSETptr *ps_p);



int
   CPXparamsetgetdbl (CPXCENVptr env, CPXCPARAMSETptr ps,
                      int whichparam, double *dval_p);



int
   CPXparamsetgetids (CPXCENVptr env, CPXCPARAMSETptr ps, int *cnt_p,
                      int *whichparams, int pspace, int *surplus_p);



int
   CPXparamsetgetint (CPXCENVptr env, CPXCPARAMSETptr ps,
                      int whichparam, CPXINT *ival_p);



int
   CPXparamsetgetlong (CPXCENVptr env, CPXCPARAMSETptr ps,
                       int whichparam, CPXLONG *ival_p);



int
   CPXparamsetgetstr (CPXCENVptr env, CPXCPARAMSETptr ps,
                      int whichparam, char *sval);



int
   CPXparamsetreadcopy (CPXENVptr env, CPXPARAMSETptr ps,
                        char const *filename_str);



int
   CPXparamsetwrite (CPXCENVptr env, CPXCPARAMSETptr ps,
                     char const *filename_str);



int
   CPXpivot (CPXCENVptr env, CPXLPptr lp, int jenter, int jleave,
             int leavestat);



int
   CPXpivotin (CPXCENVptr env, CPXLPptr lp, int const *rlist, int rlen);



int
   CPXpivotout (CPXCENVptr env, CPXLPptr lp, int const *clist,
                int clen);



int
   CPXpperwrite (CPXCENVptr env, CPXLPptr lp, char const *filename_str,
                 double epsilon);



int
   CPXpratio (CPXCENVptr env, CPXLPptr lp, int *indices, int cnt,
              double *downratio, double *upratio, int *downleave,
              int *upleave, int *downleavestatus, int *upleavestatus,
              int *downstatus, int *upstatus);



int
   CPXpreaddrows (CPXCENVptr env, CPXLPptr lp, int rcnt, int nzcnt,
                  double const *rhs, char const *sense,
                  int const *rmatbeg, int const *rmatind,
                  double const *rmatval, char **rowname);



int
   CPXprechgobj (CPXCENVptr env, CPXLPptr lp, int cnt,
                 int const *indices, double const *values);



int
   CPXpreslvwrite (CPXCENVptr env, CPXLPptr lp,
                   char const *filename_str, double *objoff_p);



int
   CPXpresolve (CPXCENVptr env, CPXLPptr lp, int method);



int
   CPXprimopt (CPXCENVptr env, CPXLPptr lp);



int
   CPXqpdjfrompi (CPXCENVptr env, CPXCLPptr lp, double const *pi,
                  double const *x, double *dj);



int
   CPXqpuncrushpi (CPXCENVptr env, CPXCLPptr lp, double *pi,
                   double const *prepi, double const *x);



int
   CPXreadcopyannotations (CPXCENVptr env, CPXLPptr lp,
                           char const *filename);



int
   CPXreadcopybase (CPXCENVptr env, CPXLPptr lp,
                    char const *filename_str);



int
   CPXreadcopyparam (CPXENVptr env, char const *filename_str);



int
   CPXreadcopyprob (CPXCENVptr env, CPXLPptr lp,
                    char const *filename_str, char const *filetype);


__attribute__ ((deprecated))
int
   CPXreadcopysol (CPXCENVptr env, CPXLPptr lp,
                   char const *filename_str);



int
   CPXreadcopystartinfo (CPXCENVptr env, CPXLPptr lp,
                         char const *filename_str);


__attribute__ ((deprecated))
int
   CPXrefineconflict (CPXCENVptr env, CPXLPptr lp, int *confnumrows_p,
                      int *confnumcols_p);



int
   CPXrefineconflictext (CPXCENVptr env, CPXLPptr lp, int grpcnt,
                         int concnt, double const *grppref,
                         int const *grpbeg, int const *grpind,
                         char const *grptype);



int
   CPXrhssa (CPXCENVptr env, CPXCLPptr lp, int begin, int end,
             double *lower, double *upper);



int
   CPXrobustopt (CPXCENVptr env, CPXLPptr lp, CPXLPptr lblp,
                 CPXLPptr ublp, double objchg, double const *maxchg);



int
   CPXserializercreate (CPXSERIALIZERptr *ser_p);



void
   CPXserializerdestroy (CPXSERIALIZERptr ser);



CPXLONG
   CPXserializerlength (CPXCSERIALIZERptr ser);



void const *
   CPXserializerpayload (CPXCSERIALIZERptr ser);



int
   CPXsetdblannotations (CPXCENVptr env, CPXLPptr lp, int idx,
                         int objtype, int cnt, int const *indices,
                         double const *values);



int
   CPXsetdblparam (CPXENVptr env, int whichparam, double newvalue);



int
   CPXsetdefaults (CPXENVptr env);



int
   CPXsetintparam (CPXENVptr env, int whichparam, CPXINT newvalue);



int
   CPXsetlogfilename (CPXCENVptr env, char const *filename,
                      char const *mode);



int
   CPXsetlongannotations (CPXCENVptr env, CPXLPptr lp, int idx,
                          int objtype, int cnt, int const *indices,
                          CPXLONG const *values);



int
   CPXsetlongparam (CPXENVptr env, int whichparam, CPXLONG newvalue);



int
   CPXsetlpcallbackfunc (CPXENVptr env,
                         int( *callback)(CPXCENVptr, void *, int, void *),
                         void *cbhandle);



int
   CPXsetnetcallbackfunc (CPXENVptr env,
                          int( *callback)(CPXCENVptr, void *, int, void *),
                          void *cbhandle);



int
   CPXsetnumobjs (CPXCENVptr env, CPXCLPptr lp, int n);



int
   CPXsetphase2 (CPXCENVptr env, CPXLPptr lp);



int
   CPXsetprofcallbackfunc (CPXENVptr env,
                           int( *callback)(CPXCENVptr, int, void *),
                           void *cbhandle);



int
   CPXsetstrparam (CPXENVptr env, int whichparam,
                   char const *newvalue_str);



int
   CPXsetterminate (CPXENVptr env, volatile int *terminate_p);



int
   CPXsettuningcallbackfunc (CPXENVptr env,
                             int( *callback)(CPXCENVptr, void *, int, void *),
                             void *cbhandle);



int
   CPXsiftopt (CPXCENVptr env, CPXLPptr lp);



int
   CPXslackfromx (CPXCENVptr env, CPXCLPptr lp, double const *x,
                  double *slack);



int
   CPXsolninfo (CPXCENVptr env, CPXCLPptr lp, int *solnmethod_p,
                int *solntype_p, int *pfeasind_p, int *dfeasind_p);



int
   CPXsolution (CPXCENVptr env, CPXCLPptr lp, int *lpstat_p,
                double *objval_p, double *x, double *pi, double *slack,
                double *dj);



int
   CPXsolwrite (CPXCENVptr env, CPXCLPptr lp, char const *filename_str);



int
   CPXsolwritesolnpool (CPXCENVptr env, CPXCLPptr lp, int soln,
                        char const *filename_str);



int
   CPXsolwritesolnpoolall (CPXCENVptr env, CPXCLPptr lp,
                           char const *filename_str);



int
   CPXstrongbranch (CPXCENVptr env, CPXLPptr lp, int const *indices,
                    int cnt, double *downobj, double *upobj, int itlim);



int
   CPXtightenbds (CPXCENVptr env, CPXLPptr lp, int cnt,
                  int const *indices, char const *lu, double const *bd);



int
   CPXtuneparam (CPXENVptr env, CPXLPptr lp, int intcnt,
                 int const *intnum, int const *intval, int dblcnt,
                 int const *dblnum, double const *dblval, int strcnt,
                 int const *strnum, char **strval, int *tunestat_p);



int
   CPXtuneparamprobset (CPXENVptr env, int filecnt, char **filename,
                        char **filetype, int intcnt, int const *intnum,
                        int const *intval, int dblcnt,
                        int const *dblnum, double const *dblval,
                        int strcnt, int const *strnum, char **strval,
                        int *tunestat_p);



int
   CPXuncrushform (CPXCENVptr env, CPXCLPptr lp, int plen,
                   int const *pind, double const *pval, int *len_p,
                   double *offset_p, int *ind, double *val);



int
   CPXuncrushpi (CPXCENVptr env, CPXCLPptr lp, double *pi,
                 double const *prepi);



int
   CPXuncrushx (CPXCENVptr env, CPXCLPptr lp, double *x,
                double const *prex);



int
   CPXunscaleprob (CPXCENVptr env, CPXLPptr lp);



CPXCCHARptr
   CPXversion (CPXCENVptr env);



int
   CPXversionnumber (CPXCENVptr env, int *version_p);



int
   CPXwriteannotations (CPXCENVptr env, CPXCLPptr lp,
                        char const *filename);



int
   CPXwritebendersannotation (CPXCENVptr env, CPXCLPptr lp,
                              char const *filename);



int
   CPXwriteparam (CPXCENVptr env, char const *filename_str);



int
   CPXwriteprob (CPXCENVptr env, CPXCLPptr lp,
                 char const *filename_str, char const *filetype);
# 1875 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cplex.h"
# 1 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cpxconst.h" 1
# 1876 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cplex.h" 2
# 1885 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cplex.h"

int
   CPXbaropt (CPXCENVptr env, CPXLPptr lp);



int
   CPXhybbaropt (CPXCENVptr env, CPXLPptr lp, int method);
# 1925 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cplex.h"

int
   CPXaddindconstraints (CPXCENVptr env, CPXLPptr lp, int indcnt,
                         int const *type, int const *indvar,
                         int const *complemented, int nzcnt,
                         double const *rhs, char const *sense,
                         int const *linbeg, int const *linind,
                         double const *linval, char **indname);



int
   CPXaddlazyconstraints (CPXCENVptr env, CPXLPptr lp, int rcnt,
                          int nzcnt, double const *rhs,
                          char const *sense, int const *rmatbeg,
                          int const *rmatind, double const *rmatval,
                          char **rowname);



int
   CPXaddmipstarts (CPXCENVptr env, CPXLPptr lp, int mcnt, int nzcnt,
                    int const *beg, int const *varindices,
                    double const *values, int const *effortlevel,
                    char **mipstartname);



int
   CPXaddsolnpooldivfilter (CPXCENVptr env, CPXLPptr lp,
                            double lower_bound, double upper_bound,
                            int nzcnt, int const *ind,
                            double const *weight, double const *refval,
                            char const *lname_str);



int
   CPXaddsolnpoolrngfilter (CPXCENVptr env, CPXLPptr lp, double lb,
                            double ub, int nzcnt, int const *ind,
                            double const *val, char const *lname_str);



int
   CPXaddsos (CPXCENVptr env, CPXLPptr lp, int numsos, int numsosnz,
              char const *sostype, int const *sosbeg,
              int const *sosind, double const *soswt, char **sosname);



int
   CPXaddusercuts (CPXCENVptr env, CPXLPptr lp, int rcnt, int nzcnt,
                   double const *rhs, char const *sense,
                   int const *rmatbeg, int const *rmatind,
                   double const *rmatval, char **rowname);



int
   CPXbendersopt (CPXCENVptr env, CPXLPptr lp);



int
   CPXbranchcallbackbranchasCPLEX (CPXCENVptr env, void *cbdata,
                                   int wherefrom, int num,
                                   void *userhandle, int *seqnum_p);



int
   CPXbranchcallbackbranchbds (CPXCENVptr env, void *cbdata,
                               int wherefrom, int cnt,
                               int const *indices, char const *lu,
                               double const *bd, double nodeest,
                               void *userhandle, int *seqnum_p);



int
   CPXbranchcallbackbranchconstraints (CPXCENVptr env, void *cbdata,
                                       int wherefrom, int rcnt,
                                       int nzcnt, double const *rhs,
                                       char const *sense,
                                       int const *rmatbeg,
                                       int const *rmatind,
                                       double const *rmatval,
                                       double nodeest,
                                       void *userhandle, int *seqnum_p);



int
   CPXbranchcallbackbranchgeneral (CPXCENVptr env, void *cbdata,
                                   int wherefrom, int varcnt,
                                   int const *varind,
                                   char const *varlu,
                                   double const *varbd, int rcnt,
                                   int nzcnt, double const *rhs,
                                   char const *sense,
                                   int const *rmatbeg,
                                   int const *rmatind,
                                   double const *rmatval,
                                   double nodeest, void *userhandle,
                                   int *seqnum_p);



int
   CPXcallbackgetgloballb (CPXCALLBACKCONTEXTptr context, double *lb,
                           int begin, int end);



int
   CPXcallbackgetglobalub (CPXCALLBACKCONTEXTptr context, double *ub,
                           int begin, int end);



int
   CPXcallbackgetlocallb (CPXCALLBACKCONTEXTptr context, double *lb,
                          int begin, int end);



int
   CPXcallbackgetlocalub (CPXCALLBACKCONTEXTptr context, double *ub,
                          int begin, int end);



int
   CPXcallbacksetnodeuserhandle (CPXCENVptr env, void *cbdata,
                                 int wherefrom, int nodeindex,
                                 void *userhandle,
                                 void **olduserhandle_p);



int
   CPXcallbacksetuserhandle (CPXCENVptr env, void *cbdata,
                             int wherefrom, void *userhandle,
                             void **olduserhandle_p);



int
   CPXchgctype (CPXCENVptr env, CPXLPptr lp, int cnt,
                int const *indices, char const *xctype);



int
   CPXchgmipstarts (CPXCENVptr env, CPXLPptr lp, int mcnt,
                    int const *mipstartindices, int nzcnt,
                    int const *beg, int const *varindices,
                    double const *values, int const *effortlevel);



int
   CPXcopyctype (CPXCENVptr env, CPXLPptr lp, char const *xctype);



int
   CPXcopyorder (CPXCENVptr env, CPXLPptr lp, int cnt,
                 int const *indices, int const *priority,
                 int const *direction);



int
   CPXcopysos (CPXCENVptr env, CPXLPptr lp, int numsos, int numsosnz,
               char const *sostype, int const *sosbeg,
               int const *sosind, double const *soswt, char **sosname);



int
   CPXcutcallbackadd (CPXCENVptr env, void *cbdata, int wherefrom,
                      int nzcnt, double rhs, int sense,
                      int const *cutind, double const *cutval,
                      int purgeable);



int
   CPXcutcallbackaddlocal (CPXCENVptr env, void *cbdata, int wherefrom,
                           int nzcnt, double rhs, int sense,
                           int const *cutind, double const *cutval);



int
   CPXdelindconstrs (CPXCENVptr env, CPXLPptr lp, int begin, int end);



int
   CPXdelmipstarts (CPXCENVptr env, CPXLPptr lp, int begin, int end);



int
   CPXdelsetmipstarts (CPXCENVptr env, CPXLPptr lp, int *delstat);



int
   CPXdelsetsolnpoolfilters (CPXCENVptr env, CPXLPptr lp, int *delstat);



int
   CPXdelsetsolnpoolsolns (CPXCENVptr env, CPXLPptr lp, int *delstat);



int
   CPXdelsetsos (CPXCENVptr env, CPXLPptr lp, int *delset);



int
   CPXdelsolnpoolfilters (CPXCENVptr env, CPXLPptr lp, int begin,
                          int end);



int
   CPXdelsolnpoolsolns (CPXCENVptr env, CPXLPptr lp, int begin,
                        int end);



int
   CPXdelsos (CPXCENVptr env, CPXLPptr lp, int begin, int end);



int
   CPXfltwrite (CPXCENVptr env, CPXCLPptr lp, char const *filename_str);



int
   CPXfreelazyconstraints (CPXCENVptr env, CPXLPptr lp);



int
   CPXfreeusercuts (CPXCENVptr env, CPXLPptr lp);



int
   CPXgetbestobjval (CPXCENVptr env, CPXCLPptr lp, double *objval_p);



int
   CPXgetbranchcallbackfunc (CPXCENVptr env,
                             int( **branchcallback_p)(CPXCENVptr xenv, void *cbdata, int wherefrom, void *cbhandle, int brtype, int brset, int nodecnt, int bdcnt, const int *nodebeg, const int *xindex, const char *lu, const double *bd, const double *nodeest, int *useraction_p),
                             void **cbhandle_p);



int
   CPXgetbranchnosolncallbackfunc (CPXCENVptr env,
                                   int( **branchnosolncallback_p)(CPXCENVptr xenv, void *cbdata, int wherefrom, void *cbhandle, int brtype, int brset, int nodecnt, int bdcnt, const int *nodebeg, const int *xindex, const char *lu, const double *bd, const double *nodeest, int *useraction_p),
                                   void **cbhandle_p);



int
   CPXgetcallbackbranchconstraints (CPXCENVptr env, void *cbdata,
                                    int wherefrom, int which,
                                    int *cuts_p, int *nzcnt_p,
                                    double *rhs, char *sense,
                                    int *rmatbeg, int *rmatind,
                                    double *rmatval, int rmatsz,
                                    int *surplus_p);



int
   CPXgetcallbackctype (CPXCENVptr env, void *cbdata, int wherefrom,
                        char *xctype, int begin, int end);



int
   CPXgetcallbackgloballb (CPXCENVptr env, void *cbdata, int wherefrom,
                           double *lb, int begin, int end);



int
   CPXgetcallbackglobalub (CPXCENVptr env, void *cbdata, int wherefrom,
                           double *ub, int begin, int end);



int
   CPXgetcallbackincumbent (CPXCENVptr env, void *cbdata,
                            int wherefrom, double *x, int begin,
                            int end);



int
   CPXgetcallbackindicatorinfo (CPXCENVptr env, void *cbdata,
                                int wherefrom, int iindex,
                                int whichinfo, void *result_p);



int
   CPXgetcallbacklp (CPXCENVptr env, void *cbdata, int wherefrom,
                     CPXCLPptr *lp_p);



int
   CPXgetcallbacknodeinfo (CPXCENVptr env, void *cbdata, int wherefrom,
                           int nodeindex, int whichinfo,
                           void *result_p);



int
   CPXgetcallbacknodeintfeas (CPXCENVptr env, void *cbdata,
                              int wherefrom, int *feas, int begin,
                              int end);



int
   CPXgetcallbacknodelb (CPXCENVptr env, void *cbdata, int wherefrom,
                         double *lb, int begin, int end);



int
   CPXgetcallbacknodelp (CPXCENVptr env, void *cbdata, int wherefrom,
                         CPXLPptr *nodelp_p);



int
   CPXgetcallbacknodeobjval (CPXCENVptr env, void *cbdata,
                             int wherefrom, double *objval_p);



int
   CPXgetcallbacknodestat (CPXCENVptr env, void *cbdata, int wherefrom,
                           int *nodestat_p);



int
   CPXgetcallbacknodeub (CPXCENVptr env, void *cbdata, int wherefrom,
                         double *ub, int begin, int end);



int
   CPXgetcallbacknodex (CPXCENVptr env, void *cbdata, int wherefrom,
                        double *x, int begin, int end);



int
   CPXgetcallbackorder (CPXCENVptr env, void *cbdata, int wherefrom,
                        int *priority, int *direction, int begin,
                        int end);



int
   CPXgetcallbackpseudocosts (CPXCENVptr env, void *cbdata,
                              int wherefrom, double *uppc,
                              double *downpc, int begin, int end);



int
   CPXgetcallbackseqinfo (CPXCENVptr env, void *cbdata, int wherefrom,
                          int seqid, int whichinfo, void *result_p);



int
   CPXgetcallbacksosinfo (CPXCENVptr env, void *cbdata, int wherefrom,
                          int sosindex, int member, int whichinfo,
                          void *result_p);



int
   CPXgetctype (CPXCENVptr env, CPXCLPptr lp, char *xctype, int begin,
                int end);



int
   CPXgetcutoff (CPXCENVptr env, CPXCLPptr lp, double *cutoff_p);



int
   CPXgetdeletenodecallbackfunc (CPXCENVptr env,
                                 void( **deletecallback_p)(CPXCENVptr xenv, int wherefrom, void *cbhandle, int seqnum, void *handle),
                                 void **cbhandle_p);



int
   CPXgetheuristiccallbackfunc (CPXCENVptr env,
                                int( **heuristiccallback_p)(CPXCENVptr xenv, void *cbdata, int wherefrom, void *cbhandle, double *objval_p, double *x, int *checkfeas_p, int *useraction_p),
                                void **cbhandle_p);



int
   CPXgetincumbentcallbackfunc (CPXCENVptr env,
                                int( **incumbentcallback_p)(CPXCENVptr xenv, void *cbdata, int wherefrom, void *cbhandle, double objval, double *x, int *isfeas_p, int *useraction_p),
                                void **cbhandle_p);



int
   CPXgetindconstr (CPXCENVptr env, CPXCLPptr lp, int *indvar_p,
                    int *complemented_p, int *nzcnt_p, double *rhs_p,
                    char *sense_p, int *linind, double *linval,
                    int space, int *surplus_p, int which);



int
   CPXgetindconstraints (CPXCENVptr env, CPXCLPptr lp, int *type,
                         int *indvar, int *complemented, int *nzcnt_p,
                         double *rhs, char *sense, int *linbeg,
                         int *linind, double *linval, int linspace,
                         int *surplus_p, int begin, int end);



int
   CPXgetindconstrindex (CPXCENVptr env, CPXCLPptr lp,
                         char const *lname_str, int *index_p);



int
   CPXgetindconstrinfeas (CPXCENVptr env, CPXCLPptr lp,
                          double const *x, double *infeasout,
                          int begin, int end);



int
   CPXgetindconstrname (CPXCENVptr env, CPXCLPptr lp, char *buf_str,
                        int bufspace, int *surplus_p, int which);



int
   CPXgetindconstrslack (CPXCENVptr env, CPXCLPptr lp,
                         double *indslack, int begin, int end);



int
   CPXgetinfocallbackfunc (CPXCENVptr env,
                           int( **callback_p)(CPXCENVptr, void *, int, void *),
                           void **cbhandle_p);



int
   CPXgetlazyconstraintcallbackfunc (CPXCENVptr env,
                                     int( **cutcallback_p)(CPXCENVptr xenv, void *cbdata, int wherefrom, void *cbhandle, int *useraction_p),
                                     void **cbhandle_p);



int
   CPXgetmipcallbackfunc (CPXCENVptr env,
                          int( **callback_p)(CPXCENVptr, void *, int, void *),
                          void **cbhandle_p);



int
   CPXgetmipitcnt (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetmiprelgap (CPXCENVptr env, CPXCLPptr lp, double *gap_p);



int
   CPXgetmipstartindex (CPXCENVptr env, CPXCLPptr lp,
                        char const *lname_str, int *index_p);



int
   CPXgetmipstartname (CPXCENVptr env, CPXCLPptr lp, char **name,
                       char *store, int storesz, int *surplus_p,
                       int begin, int end);



int
   CPXgetmipstarts (CPXCENVptr env, CPXCLPptr lp, int *nzcnt_p,
                    int *beg, int *varindices, double *values,
                    int *effortlevel, int startspace, int *surplus_p,
                    int begin, int end);



int
   CPXgetnodecallbackfunc (CPXCENVptr env,
                           int( **nodecallback_p)(CPXCENVptr xenv, void *cbdata, int wherefrom, void *cbhandle, int *nodeindex, int *useraction),
                           void **cbhandle_p);



int
   CPXgetnodecnt (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnodeint (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnodeleftcnt (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnumbin (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnumcuts (CPXCENVptr env, CPXCLPptr lp, int cuttype,
                  int *num_p);



int
   CPXgetnumindconstrs (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnumint (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnumlazyconstraints (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnummipstarts (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnumsemicont (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnumsemiint (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnumsos (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnumusercuts (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetorder (CPXCENVptr env, CPXCLPptr lp, int *cnt_p, int *indices,
                int *priority, int *direction, int ordspace,
                int *surplus_p);



int
   CPXgetsolnpooldivfilter (CPXCENVptr env, CPXCLPptr lp,
                            double *lower_cutoff_p,
                            double *upper_cutoff_p, int *nzcnt_p,
                            int *ind, double *val, double *refval,
                            int space, int *surplus_p, int which);



int
   CPXgetsolnpoolfilterindex (CPXCENVptr env, CPXCLPptr lp,
                              char const *lname_str, int *index_p);



int
   CPXgetsolnpoolfiltername (CPXCENVptr env, CPXCLPptr lp,
                             char *buf_str, int bufspace,
                             int *surplus_p, int which);



int
   CPXgetsolnpoolfiltertype (CPXCENVptr env, CPXCLPptr lp,
                             int *ftype_p, int which);



int
   CPXgetsolnpoolmeanobjval (CPXCENVptr env, CPXCLPptr lp,
                             double *meanobjval_p);



int
   CPXgetsolnpoolnumfilters (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetsolnpoolnumreplaced (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetsolnpoolnumsolns (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetsolnpoolobjval (CPXCENVptr env, CPXCLPptr lp, int soln,
                         double *objval_p);



int
   CPXgetsolnpoolqconstrslack (CPXCENVptr env, CPXCLPptr lp, int soln,
                               double *qcslack, int begin, int end);



int
   CPXgetsolnpoolrngfilter (CPXCENVptr env, CPXCLPptr lp, double *lb_p,
                            double *ub_p, int *nzcnt_p, int *ind,
                            double *val, int space, int *surplus_p,
                            int which);



int
   CPXgetsolnpoolslack (CPXCENVptr env, CPXCLPptr lp, int soln,
                        double *slack, int begin, int end);



int
   CPXgetsolnpoolsolnindex (CPXCENVptr env, CPXCLPptr lp,
                            char const *lname_str, int *index_p);



int
   CPXgetsolnpoolsolnname (CPXCENVptr env, CPXCLPptr lp, char *store,
                           int storesz, int *surplus_p, int which);



int
   CPXgetsolnpoolx (CPXCENVptr env, CPXCLPptr lp, int soln, double *x,
                    int begin, int end);



int
   CPXgetsolvecallbackfunc (CPXCENVptr env,
                            int( **solvecallback_p)(CPXCENVptr xenv, void *cbdata, int wherefrom, void *cbhandle, int *useraction),
                            void **cbhandle_p);



int
   CPXgetsos (CPXCENVptr env, CPXCLPptr lp, int *numsosnz_p,
              char *sostype, int *sosbeg, int *sosind, double *soswt,
              int sosspace, int *surplus_p, int begin, int end);



int
   CPXgetsosindex (CPXCENVptr env, CPXCLPptr lp, char const *lname_str,
                   int *index_p);



int
   CPXgetsosinfeas (CPXCENVptr env, CPXCLPptr lp, double const *x,
                    double *infeasout, int begin, int end);



int
   CPXgetsosname (CPXCENVptr env, CPXCLPptr lp, char **name,
                  char *namestore, int storespace, int *surplus_p,
                  int begin, int end);



int
   CPXgetsubmethod (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetsubstat (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetusercutcallbackfunc (CPXCENVptr env,
                              int( **cutcallback_p)(CPXCENVptr xenv, void *cbdata, int wherefrom, void *cbhandle, int *useraction_p),
                              void **cbhandle_p);



int
   CPXindconstrslackfromx (CPXCENVptr env, CPXCLPptr lp,
                           double const *x, double *indslack);



int
   CPXmipopt (CPXCENVptr env, CPXLPptr lp);



int
   CPXordread (CPXCENVptr env, char const *filename_str, int numcols,
               char **colname, int *cnt_p, int *indices, int *priority,
               int *direction);



int
   CPXordwrite (CPXCENVptr env, CPXCLPptr lp, char const *filename_str);



int
   CPXpopulate (CPXCENVptr env, CPXLPptr lp);



int
   CPXreadcopymipstarts (CPXCENVptr env, CPXLPptr lp,
                         char const *filename_str);



int
   CPXreadcopyorder (CPXCENVptr env, CPXLPptr lp,
                     char const *filename_str);



int
   CPXreadcopysolnpoolfilters (CPXCENVptr env, CPXLPptr lp,
                               char const *filename_str);


__attribute__ ((deprecated))
int
   CPXrefinemipstartconflict (CPXCENVptr env, CPXLPptr lp,
                              int mipstartindex, int *confnumrows_p,
                              int *confnumcols_p);



int
   CPXrefinemipstartconflictext (CPXCENVptr env, CPXLPptr lp,
                                 int mipstartindex, int grpcnt,
                                 int concnt, double const *grppref,
                                 int const *grpbeg, int const *grpind,
                                 char const *grptype);



int
   CPXsetbranchcallbackfunc (CPXENVptr env,
                             int( *branchcallback)(CPXCENVptr xenv, void *cbdata, int wherefrom, void *cbhandle, int brtype, int brset, int nodecnt, int bdcnt, const int *nodebeg, const int *xindex, const char *lu, const double *bd, const double *nodeest, int *useraction_p),
                             void *cbhandle);



int
   CPXsetbranchnosolncallbackfunc (CPXENVptr env,
                                   int( *branchnosolncallback)(CPXCENVptr xenv, void *cbdata, int wherefrom, void *cbhandle, int brtype, int brset, int nodecnt, int bdcnt, const int *nodebeg, const int *xindex, const char *lu, const double *bd, const double *nodeest, int *useraction_p),
                                   void *cbhandle);



int
   CPXsetdeletenodecallbackfunc (CPXENVptr env,
                                 void( *deletecallback)(CPXCENVptr xenv, int wherefrom, void *cbhandle, int seqnum, void *handle),
                                 void *cbhandle);



int
   CPXsetheuristiccallbackfunc (CPXENVptr env,
                                int( *heuristiccallback)(CPXCENVptr xenv, void *cbdata, int wherefrom, void *cbhandle, double *objval_p, double *x, int *checkfeas_p, int *useraction_p),
                                void *cbhandle);



int
   CPXsetincumbentcallbackfunc (CPXENVptr env,
                                int( *incumbentcallback)(CPXCENVptr xenv, void *cbdata, int wherefrom, void *cbhandle, double objval, double *x, int *isfeas_p, int *useraction_p),
                                void *cbhandle);



int
   CPXsetinfocallbackfunc (CPXENVptr env,
                           int( *callback)(CPXCENVptr, void *, int, void *),
                           void *cbhandle);



int
   CPXsetlazyconstraintcallbackfunc (CPXENVptr env,
                                     int( *lazyconcallback)(CPXCENVptr xenv, void *cbdata, int wherefrom, void *cbhandle, int *useraction_p),
                                     void *cbhandle);



int
   CPXsetmipcallbackfunc (CPXENVptr env,
                          int( *callback)(CPXCENVptr, void *, int, void *),
                          void *cbhandle);



int
   CPXsetnodecallbackfunc (CPXENVptr env,
                           int( *nodecallback)(CPXCENVptr xenv, void *cbdata, int wherefrom, void *cbhandle, int *nodeindex, int *useraction),
                           void *cbhandle);



int
   CPXsetsolvecallbackfunc (CPXENVptr env,
                            int( *solvecallback)(CPXCENVptr xenv, void *cbdata, int wherefrom, void *cbhandle, int *useraction),
                            void *cbhandle);



int
   CPXsetusercutcallbackfunc (CPXENVptr env,
                              int( *cutcallback)(CPXCENVptr xenv, void *cbdata, int wherefrom, void *cbhandle, int *useraction_p),
                              void *cbhandle);



int
   CPXwritemipstarts (CPXCENVptr env, CPXCLPptr lp,
                      char const *filename_str, int begin, int end);
# 2843 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cplex.h"

int
   CPXaddindconstr (CPXCENVptr env, CPXLPptr lp, int indvar,
                    int complemented, int nzcnt, double rhs, int sense,
                    int const *linind, double const *linval,
                    char const *indname_str);
# 2873 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cplex.h"

int
   CPXNETaddarcs (CPXCENVptr env, CPXNETptr net, int narcs,
                  int const *fromnode, int const *tonode,
                  double const *low, double const *up,
                  double const *obj, char **anames);



int
   CPXNETaddnodes (CPXCENVptr env, CPXNETptr net, int nnodes,
                   double const *supply, char **name);



int
   CPXNETbasewrite (CPXCENVptr env, CPXCNETptr net,
                    char const *filename_str);



int
   CPXNETchgarcname (CPXCENVptr env, CPXNETptr net, int cnt,
                     int const *indices, char **newname);



int
   CPXNETchgarcnodes (CPXCENVptr env, CPXNETptr net, int cnt,
                      int const *indices, int const *fromnode,
                      int const *tonode);



int
   CPXNETchgbds (CPXCENVptr env, CPXNETptr net, int cnt,
                 int const *indices, char const *lu, double const *bd);



int
   CPXNETchgname (CPXCENVptr env, CPXNETptr net, int key, int vindex,
                  char const *name_str);



int
   CPXNETchgnodename (CPXCENVptr env, CPXNETptr net, int cnt,
                      int const *indices, char **newname);



int
   CPXNETchgobj (CPXCENVptr env, CPXNETptr net, int cnt,
                 int const *indices, double const *obj);



int
   CPXNETchgobjsen (CPXCENVptr env, CPXNETptr net, int maxormin);



int
   CPXNETchgsupply (CPXCENVptr env, CPXNETptr net, int cnt,
                    int const *indices, double const *supply);



int
   CPXNETcopybase (CPXCENVptr env, CPXNETptr net, int const *astat,
                   int const *nstat);



int
   CPXNETcopynet (CPXCENVptr env, CPXNETptr net, int objsen,
                  int nnodes, double const *supply, char **nnames,
                  int narcs, int const *fromnode, int const *tonode,
                  double const *low, double const *up,
                  double const *obj, char **anames);



CPXNETptr
   CPXNETcreateprob (CPXENVptr env, int *status_p,
                     char const *name_str);



int
   CPXNETdelarcs (CPXCENVptr env, CPXNETptr net, int begin, int end);



int
   CPXNETdelnodes (CPXCENVptr env, CPXNETptr net, int begin, int end);



int
   CPXNETdelset (CPXCENVptr env, CPXNETptr net, int *whichnodes,
                 int *whicharcs);



int
   CPXNETfreeprob (CPXENVptr env, CPXNETptr *net_p);



int
   CPXNETgetarcindex (CPXCENVptr env, CPXCNETptr net,
                      char const *lname_str, int *index_p);



int
   CPXNETgetarcname (CPXCENVptr env, CPXCNETptr net, char **nnames,
                     char *namestore, int namespc, int *surplus_p,
                     int begin, int end);



int
   CPXNETgetarcnodes (CPXCENVptr env, CPXCNETptr net, int *fromnode,
                      int *tonode, int begin, int end);



int
   CPXNETgetbase (CPXCENVptr env, CPXCNETptr net, int *astat,
                  int *nstat);



int
   CPXNETgetdj (CPXCENVptr env, CPXCNETptr net, double *dj, int begin,
                int end);



int
   CPXNETgetitcnt (CPXCENVptr env, CPXCNETptr net);



int
   CPXNETgetlb (CPXCENVptr env, CPXCNETptr net, double *low, int begin,
                int end);



int
   CPXNETgetnodearcs (CPXCENVptr env, CPXCNETptr net, int *arccnt_p,
                      int *arcbeg, int *arc, int arcspace,
                      int *surplus_p, int begin, int end);



int
   CPXNETgetnodeindex (CPXCENVptr env, CPXCNETptr net,
                       char const *lname_str, int *index_p);



int
   CPXNETgetnodename (CPXCENVptr env, CPXCNETptr net, char **nnames,
                      char *namestore, int namespc, int *surplus_p,
                      int begin, int end);



int
   CPXNETgetnumarcs (CPXCENVptr env, CPXCNETptr net);



int
   CPXNETgetnumnodes (CPXCENVptr env, CPXCNETptr net);



int
   CPXNETgetobj (CPXCENVptr env, CPXCNETptr net, double *obj,
                 int begin, int end);



int
   CPXNETgetobjsen (CPXCENVptr env, CPXCNETptr net);



int
   CPXNETgetobjval (CPXCENVptr env, CPXCNETptr net, double *objval_p);



int
   CPXNETgetphase1cnt (CPXCENVptr env, CPXCNETptr net);



int
   CPXNETgetpi (CPXCENVptr env, CPXCNETptr net, double *pi, int begin,
                int end);



int
   CPXNETgetprobname (CPXCENVptr env, CPXCNETptr net, char *buf_str,
                      int bufspace, int *surplus_p);



int
   CPXNETgetslack (CPXCENVptr env, CPXCNETptr net, double *slack,
                   int begin, int end);



int
   CPXNETgetstat (CPXCENVptr env, CPXCNETptr net);



int
   CPXNETgetsupply (CPXCENVptr env, CPXCNETptr net, double *supply,
                    int begin, int end);



int
   CPXNETgetub (CPXCENVptr env, CPXCNETptr net, double *up, int begin,
                int end);



int
   CPXNETgetx (CPXCENVptr env, CPXCNETptr net, double *x, int begin,
               int end);



int
   CPXNETprimopt (CPXCENVptr env, CPXNETptr net);



int
   CPXNETreadcopybase (CPXCENVptr env, CPXNETptr net,
                       char const *filename_str);



int
   CPXNETreadcopyprob (CPXCENVptr env, CPXNETptr net,
                       char const *filename_str);



int
   CPXNETsolninfo (CPXCENVptr env, CPXCNETptr net, int *pfeasind_p,
                   int *dfeasind_p);



int
   CPXNETsolution (CPXCENVptr env, CPXCNETptr net, int *netstat_p,
                   double *objval_p, double *x, double *pi,
                   double *slack, double *dj);



int
   CPXNETwriteprob (CPXCENVptr env, CPXCNETptr net,
                    char const *filename_str, char const *format_str);
# 3175 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cplex.h"

int
   CPXchgqpcoef (CPXCENVptr env, CPXLPptr lp, int i, int j,
                 double newvalue);



int
   CPXcopyqpsep (CPXCENVptr env, CPXLPptr lp, double const *qsepvec);



int
   CPXcopyquad (CPXCENVptr env, CPXLPptr lp, int const *qmatbeg,
                int const *qmatcnt, int const *qmatind,
                double const *qmatval);



int
   CPXgetnumqpnz (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetnumquad (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetqpcoef (CPXCENVptr env, CPXCLPptr lp, int rownum, int colnum,
                 double *coef_p);



int
   CPXgetquad (CPXCENVptr env, CPXCLPptr lp, int *nzcnt_p,
               int *qmatbeg, int *qmatind, double *qmatval,
               int qmatspace, int *surplus_p, int begin, int end);



int
   CPXqpindefcertificate (CPXCENVptr env, CPXCLPptr lp, double *x);



int
   CPXqpopt (CPXCENVptr env, CPXLPptr lp);
# 3248 "/home/mariana/tese/CPLEX_Studio201/cplex/include/ilcplex/cplex.h"

int
   CPXaddqconstr (CPXCENVptr env, CPXLPptr lp, int linnzcnt,
                  int quadnzcnt, double rhs, int sense,
                  int const *linind, double const *linval,
                  int const *quadrow, int const *quadcol,
                  double const *quadval, char const *lname_str);



int
   CPXdelqconstrs (CPXCENVptr env, CPXLPptr lp, int begin, int end);



int
   CPXgetnumqconstrs (CPXCENVptr env, CPXCLPptr lp);



int
   CPXgetqconstr (CPXCENVptr env, CPXCLPptr lp, int *linnzcnt_p,
                  int *quadnzcnt_p, double *rhs_p, char *sense_p,
                  int *linind, double *linval, int linspace,
                  int *linsurplus_p, int *quadrow, int *quadcol,
                  double *quadval, int quadspace, int *quadsurplus_p,
                  int which);



int
   CPXgetqconstrdslack (CPXCENVptr env, CPXCLPptr lp, int qind,
                        int *nz_p, int *ind, double *val, int space,
                        int *surplus_p);



int
   CPXgetqconstrindex (CPXCENVptr env, CPXCLPptr lp,
                       char const *lname_str, int *index_p);



int
   CPXgetqconstrinfeas (CPXCENVptr env, CPXCLPptr lp, double const *x,
                        double *infeasout, int begin, int end);



int
   CPXgetqconstrname (CPXCENVptr env, CPXCLPptr lp, char *buf_str,
                      int bufspace, int *surplus_p, int which);



int
   CPXgetqconstrslack (CPXCENVptr env, CPXCLPptr lp, double *qcslack,
                       int begin, int end);



int
   CPXgetxqxax (CPXCENVptr env, CPXCLPptr lp, double *xqxax, int begin,
                int end);



int
   CPXqconstrslackfromx (CPXCENVptr env, CPXCLPptr lp, double const *x,
                         double *qcslack);
# 7 "sa.c" 2



# 1 "ILP.h" 1


# 1 "graph.h" 1





# 1 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stdbool.h" 1 3 4
# 7 "graph.h" 2


typedef struct TU{
    int code;
    int num_code;
    int voters;
    int num_neighbors;
    int* neighbor_codes;
    int* border_sizes;
    
# 16 "graph.h" 3 4
   _Bool 
# 16 "graph.h"
        assigned;
    int cluster_id;
    int visited;
    int unit_id;
    int* neighbor_ids;
} TU;

TU** graph (char* fp, int* d, int* k, int* n, int* m);

void free_units(TU** units);
# 4 "ILP.h" 2
# 1 "state.h" 1




typedef struct
{
    TU **units;
    int size;
    int population;
} Cluster;

int _pop_ideal(int d);
void popul_test1(TU **units, int n, int k, int ideal_pop);
int energy_population(TU **units, Cluster *cluster, int margin, int k, int n, int ideal_pop);
int energy_compactness(Cluster *clusters, int k);

int
energy(TU** units, Cluster* clusters, int margin, int k, int n);
Cluster** first_cluster(TU **units, int k, int n);
void change_unit(Cluster *clusters, TU **units, int k, int n);


Cluster**
transitionBound(int ell , TU** units, int k, int n, FILE *pf_out
  );


Cluster** storeState(Cluster *clusters, int k, int n);
# 5 "ILP.h" 2
typedef struct {
    int code;
    int *indices;
} Mapping;

typedef struct {
    int code;
    int index;
    int num_mappings;
    Mapping *mappings;
} CodeIndexMapping;

void create_code_index(TU **units, int n);


void create_flow_decision_variables(TU **units, int n, int k, CPXENVptr env, CPXLPptr lp);

int create_decision_variables(TU **units,int k, int n, CPXENVptr env, CPXLPptr lp);

void add_fixed_cluster_constraints(CPXENVptr env, CPXLPptr lp, TU** units, Cluster* clusters, int num_units, int num_clusters, int ideal_pop);

Cluster** runILP(TU **units, int k, int n, int m, int ideal_pop, Cluster* clusters);
# 11 "sa.c" 2
# 1 "sa.h" 1






double
getTemperature(double cp,
               int d
               );



int
getEll(double T,
       unsigned int *R
       );



int
runSA(double Tstart,
      double Tstop,
      int batch,
      int steps,
      TU** units, int k, int n, int m, int populacao_ideal
      );
# 12 "sa.c" 2


# 1 "timer.h" 1



void
startTimer(void);

double
getTime(void);
# 15 "sa.c" 2

static int
myRandom(void)
{
  return random();
}


double
getTemperature(double cp,
               int ell
)
{
  
# 28 "sa.c" 3 4
 ((void) (0))
                                  
# 29 "sa.c"
                                 ;
  
# 30 "sa.c" 3 4
 ((void) (0))
                                                       
# 31 "sa.c"
                                                      ;

  double res = cp;
  res /= 1.0 - cp;
  res = log2(res);
  res /= ((double)ell) - 0.5;

  return res;
}

int
getEll(double T,
       unsigned int *pR
)
{
  double c = 1.0;

  *pR = arc4random();


  unsigned int R = *pR;

  if (0 != R)
  {
    c = log2(-R);
    c -= log2(R);
    c /= T;
    c = round(c);
  }

  return (int)c;
}

void print_best_clusters(Cluster *best_clusters, TU **units, int k, int n, FILE *output_file, int ideal_population)
{
  int total_population = 0;
  double max_population_deviation_percentage = 0.0;
  double final_population_deviation = 0.0;
  int total_deviation = 0;
  int max_deviation = 0;
  double deviation_percentage = 0.0;

  printf("ideal pop: %d\n", ideal_population);
  fprintf(output_file, "\nBest solution found:\n");
  printf("Best solution found:\n");
  for (int i = 0; i < k; i++)
  {
    int pop_cluster = 0;
    printf("%d:", i);
    fprintf(output_file, "%d:", i);
    for (int j = 0; j < best_clusters[i].size; j++)
    {
      pop_cluster = pop_cluster + best_clusters[i].units[j]->voters;
      int unit_code = best_clusters[i].units[j]->code / 1;
      printf("%d,", unit_code);
      fprintf(output_file, "%d,", unit_code);
    }
    printf(" --> população: %d", pop_cluster);
    printf("\n");
    fprintf(output_file, " --> população: %d", pop_cluster);
    fprintf(output_file, "\n");

    int deviation = abs(pop_cluster - ideal_population);
    printf("deviation: %d\n", deviation);
    if (deviation > max_deviation)
    {
      max_deviation = deviation;
    }

    deviation_percentage = ((double)max_deviation / ideal_population) * 100.0;
  }
  printf("final population deviation to theoretical best value: %lf%%\n", deviation_percentage);
  fprintf(output_file, "final population deviation to theoretical best value: %lf%%\n", deviation_percentage);

  printf("maximum deviation of population between electoral districts: %lf%%\n", deviation_percentage);
  fprintf(output_file, "maximum deviation of population between electoral districts: %lf%%\n", deviation_percentage);

  int energy__compactness = energy_compactness(best_clusters, k);
  printf("fronteiras internas: %d\n\n", energy__compactness);
  fprintf(output_file, "fronteiras internas: %d\n\n", energy__compactness);
}

int runSA(double Tstart,
          double Tstop,
          int batch,
          int steps,
          TU **units, int k, int n, int m, int ideal_pop)
{

  clock_t start, end;
  double cpu_time_used;

  start = clock();

  int max = 0;
  double T = Tstart;

  double temperature_population = Tstart;
  double temperature_compactness = Tstart;
  printf("temp start : %f\n", Tstart);

  double Td = Tstop - Tstart;
  Td /= steps;
  int ell = 1;
  unsigned int R;
  int best_energy_population = 0x7fffffff;
  int best_energy_compactness = 
# 137 "sa.c" 3 4
                               (-0x7fffffff - 1)
# 137 "sa.c"
                                      ;
  long long Final_energy_population = 0x7fffffffffffffffL;
  int Final_energy_compactness = 
# 139 "sa.c" 3 4
                                (-0x7fffffff - 1)
# 139 "sa.c"
                                       ;
  Cluster *stored_state = 
# 140 "sa.c" 3 4
                         ((void *)0)
# 140 "sa.c"
                             ;

  double ratio = Tstop / Tstart;

  double exponent = 1.0 / steps;

  double alpha = pow(ratio, exponent);



  int perfect_score = 0;
  int not_as_great_score = 0;
# 161 "sa.c"
  printf("\nSA start!\n\n");

  double startingValue = 1.0;
  double endingValue = 0.000001;
  int numIterations = 20;

  double increment = (endingValue - startingValue) / (numIterations - 1);

  int iteration;
  double value;
  srand(time(
# 171 "sa.c" 3 4
            ((void *)0)
# 171 "sa.c"
                ));
  FILE *output_file = fopen("output.txt", "w");
  FILE *sa_graph_file = fopen("SA_graph.txt", "w");
  fprintf(output_file, "%d;%d;%d\n", k, n, steps);

  Cluster *clusters = first_cluster(units, k, n);
  Cluster *best_clusters = 
# 177 "sa.c" 3 4
                          ((void *)0)
# 177 "sa.c"
                              ;



  for (int i = 0; i < k; i++)
  {
    int pop_cluster = 0;
    fprintf(output_file, "0,%d:", i);
    printf("Cluster %d with size %d: ", i, clusters[i].size);
    for (int j = 0; j < clusters[i].size; j++)
    {
      int unit_code = clusters[i].units[j]->code / 1;
      printf("%d ", clusters[i].units[j]->code);
      fprintf(output_file, "%d,", unit_code);
      pop_cluster = pop_cluster + clusters[i].units[j]->voters;
    }
    printf(" --> população: %d", pop_cluster);
    printf("\n");
    fprintf(output_file, "\n");
  }

  for (int s = 1; s <= numIterations; s++)
  {

    ell = getEll(T, &R);
    FILE *fp_out = fopen("cluster_info.txt", "w");
    change_unit(clusters, units, k, n);
# 232 "sa.c"
    int energy__population = energy_population(units, clusters, m, k, n, ideal_pop);

     int energy__compactness = energy_compactness(clusters, k);

     printf("best energy pop: %d, energy pop: %d \nbest energy comp: %d, energy comp: %d\n", best_energy_population, energy__population, best_energy_compactness, energy__compactness);
# 258 "sa.c"
    printf("temperature population: %f, temperature compactness: %f\n", temperature_population, temperature_compactness);


    double accept_prob_population = exp((best_energy_population - energy__population) / temperature_population);
    double accept_prob_compactness = exp((best_energy_compactness - energy__compactness) / temperature_compactness);

    printf("---- here:accpet prob pop: %f and ccpet prob comp: %f\n", accept_prob_population, accept_prob_compactness);

    double accept_prob = ((accept_prob_population) < (accept_prob_compactness) ? (accept_prob_population) : (accept_prob_compactness));

    double random_number = (double)rand() / (double)
# 268 "sa.c" 3 4
                                                   2147483647
# 268 "sa.c"
                                                           ;
    if (random_number < accept_prob)
    {
      if (accept_prob != 1.0)
        not_as_great_score++;

      if ((energy__compactness > Final_energy_compactness && energy__population <= Final_energy_population) ||
          (energy__compactness >= Final_energy_compactness && energy__population < Final_energy_population))
      {
        Final_energy_compactness = energy__compactness;
        Final_energy_population = energy__population;

        if (best_clusters == 
# 280 "sa.c" 3 4
                            ((void *)0)
# 280 "sa.c"
                                )
        {
          best_clusters = malloc(k * sizeof(Cluster));
          for (int i = 0; i < k; i++)
          {
            best_clusters[i].units = malloc(n * sizeof(TU *));
            best_clusters[i].size = 0;
          }
        }
        for (int i = 0; i < k; i++)
        {
          best_clusters[i].size = clusters[i].size;
          memcpy(best_clusters[i].units, clusters[i].units, clusters[i].size * sizeof(TU *));
        }
      }

      if (accept_prob_population > random_number)
    {
        best_energy_population = energy__population;

    }


    if (accept_prob_compactness > random_number)
    {
        best_energy_compactness = energy__compactness;

    }

      int max_deviation = 0;
      double deviation_percentage = 0.0;

      for (int i = 0; i < k; i++)
      {
        int pop_cluster = 0;
        fprintf(output_file, "%d,%d:", s, i);
        for (int j = 0; j < clusters[i].size; j++)
        {
          pop_cluster = pop_cluster + clusters[i].units[j]->voters;
          int unit_code = clusters[i].units[j]->code / 1;
          fprintf(output_file, "%d,", unit_code);
        }
        fprintf(output_file, " --> população: %d", pop_cluster);
        fprintf(output_file, "\n");

        int deviation = abs(pop_cluster - ideal_pop);
        if (deviation > max_deviation)
        {
          max_deviation = deviation;
        }
      }
      deviation_percentage = ((double)max_deviation / ideal_pop) * 100.0;
      fprintf(output_file, "prob: %f and random: %f\n", accept_prob, random_number);
      fprintf(output_file, "fronteiras internas: %d\n\n", best_energy_compactness);

      fprintf(sa_graph_file, "%d,%f,%d,%f\n", s, deviation_percentage, best_energy_compactness, accept_prob);

      stored_state = storeState(clusters, k, n);
    }




    if (s % (numIterations/10) == 0)
{

  printf("Temperature Population: %f, Temperature Compactness: %f, T: %f\n", temperature_population, temperature_compactness, T);

  printf("----->iteration: %d, perfect: %d, not_perfect: %d\n", s, perfect_score, not_as_great_score);

  for (int i = 0; i < k; i++)
  {
    int pop_cluster = 0;
    printf("Cluster %d with size %d: ", i, clusters[i].size);

    for (int j = 0; j < clusters[i].size; j++)
    {
      pop_cluster += clusters[i].units[j]->voters;
    }

    printf(" --> population: %d\n", pop_cluster);
  }

  long long current_energy_population = energy_population(units, clusters, m, k, n, ideal_pop);
  int current_energy_compactness = energy_compactness(clusters, k);

  double current_accept_prob_population = exp((best_energy_population - current_energy_population) / temperature_population);
  double current_accept_prob_compactness = exp((best_energy_compactness - current_energy_compactness) / temperature_compactness);

  double current_accept_prob = ((current_accept_prob_population) < (current_accept_prob_compactness) ? (current_accept_prob_population) : (current_accept_prob_compactness));

  printf("Borders: %d prob: %f\n\n", current_energy_compactness, current_accept_prob_compactness);
  printf("pop: %d prob: %f\n\n", current_energy_population, current_accept_prob_population);




}
    temperature_population *= alpha;
    temperature_compactness *= alpha;
    T *= alpha;

    increment = (endingValue - startingValue) / (numIterations - 1);
  }

  if (best_clusters != 
# 385 "sa.c" 3 4
                      ((void *)0)
# 385 "sa.c"
                          )
  {
    print_best_clusters(best_clusters, units, k, n, output_file, ideal_pop);
    for (int i = 0; i < k; i++)
    {
      free(best_clusters[i].units);
    }
    free(best_clusters);
  }
  fclose(output_file);

  printf("\n");
  printf("SA end!\n");
  end = clock();
  cpu_time_used = ((double) (end - start)) / 
# 399 "sa.c" 3 4
                                            ((__clock_t) 1000000)
# 399 "sa.c"
                                                          ;

  printf("Time taken: %f seconds\n", cpu_time_used);

  return;
}
