This is a single shell script that runs in both bash and csh and on both
Linux and FreeBSD.  It displays the current CPU model name and microcode
version on any amd64 / x86_64 CPU.  It does not have any dependencies other
than what ships with the OS.

On Linux it can run as any user, on FreeBSD it requires root access to
execute `cpucontrol`.

Example output on an AMD CPU on FreeBSD:

```
# csh getcpumicrocode.sh
AMD EPYC 7351 16-Core Processor
0x0800126e
```

Example output on an Intel CPU on Linux:

```
$ bash getcpumicrocode.sh
Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz
0x44
```
