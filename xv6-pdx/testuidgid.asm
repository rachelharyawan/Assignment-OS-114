
_testuidgid:     file format elf32-i386


Disassembly of section .text:

00000000 <uidTest>:
#include "types.h"
#include "user.h"

static void
uidTest(uint nval)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 04             	sub    $0x4,%esp
   7:	89 c3                	mov    %eax,%ebx
  uint uid = getuid();
   9:	e8 3e 06 00 00       	call   64c <getuid>
  printf(1, "Current UID is: %d\n", uid);
   e:	83 ec 04             	sub    $0x4,%esp
  11:	50                   	push   %eax
  12:	68 dc 09 00 00       	push   $0x9dc
  17:	6a 01                	push   $0x1
  19:	e8 ff 06 00 00       	call   71d <printf>
  printf(1, "Setting UID to %d\n", nval);
  1e:	83 c4 0c             	add    $0xc,%esp
  21:	53                   	push   %ebx
  22:	68 f0 09 00 00       	push   $0x9f0
  27:	6a 01                	push   $0x1
  29:	e8 ef 06 00 00       	call   71d <printf>
  if (setuid(nval) < 0)
  2e:	89 1c 24             	mov    %ebx,(%esp)
  31:	e8 2e 06 00 00       	call   664 <setuid>
  36:	83 c4 10             	add    $0x10,%esp
  39:	85 c0                	test   %eax,%eax
  3b:	78 29                	js     66 <uidTest+0x66>
    printf(2, "Error. Invalid UID: %d\n", nval);
  uid = getuid();
  3d:	e8 0a 06 00 00       	call   64c <getuid>
  printf(1, "Current UID is: %d\n", uid);
  42:	83 ec 04             	sub    $0x4,%esp
  45:	50                   	push   %eax
  46:	68 dc 09 00 00       	push   $0x9dc
  4b:	6a 01                	push   $0x1
  4d:	e8 cb 06 00 00       	call   71d <printf>
  sleep(5 * TPS);  // now type control-p
  52:	c7 04 24 88 13 00 00 	movl   $0x1388,(%esp)
  59:	e8 ce 05 00 00       	call   62c <sleep>
}
  5e:	83 c4 10             	add    $0x10,%esp
  61:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  64:	c9                   	leave  
  65:	c3                   	ret    
    printf(2, "Error. Invalid UID: %d\n", nval);
  66:	83 ec 04             	sub    $0x4,%esp
  69:	53                   	push   %ebx
  6a:	68 03 0a 00 00       	push   $0xa03
  6f:	6a 02                	push   $0x2
  71:	e8 a7 06 00 00       	call   71d <printf>
  76:	83 c4 10             	add    $0x10,%esp
  79:	eb c2                	jmp    3d <uidTest+0x3d>

0000007b <gidTest>:

static void
gidTest(uint nval)
{
  7b:	55                   	push   %ebp
  7c:	89 e5                	mov    %esp,%ebp
  7e:	53                   	push   %ebx
  7f:	83 ec 04             	sub    $0x4,%esp
  82:	89 c3                	mov    %eax,%ebx
  uint gid = getgid();
  84:	e8 cb 05 00 00       	call   654 <getgid>
  printf(1, "Current GID is: %d\n", gid);
  89:	83 ec 04             	sub    $0x4,%esp
  8c:	50                   	push   %eax
  8d:	68 1b 0a 00 00       	push   $0xa1b
  92:	6a 01                	push   $0x1
  94:	e8 84 06 00 00       	call   71d <printf>
  printf(1, "Setting GID to %d\n", nval);
  99:	83 c4 0c             	add    $0xc,%esp
  9c:	53                   	push   %ebx
  9d:	68 2f 0a 00 00       	push   $0xa2f
  a2:	6a 01                	push   $0x1
  a4:	e8 74 06 00 00       	call   71d <printf>
  if (setgid(nval) < 0)
  a9:	89 1c 24             	mov    %ebx,(%esp)
  ac:	e8 bb 05 00 00       	call   66c <setgid>
  b1:	83 c4 10             	add    $0x10,%esp
  b4:	85 c0                	test   %eax,%eax
  b6:	78 32                	js     ea <gidTest+0x6f>
    printf(2, "Error. Invalid GID: %d\n", nval);
  setgid(nval);
  b8:	83 ec 0c             	sub    $0xc,%esp
  bb:	53                   	push   %ebx
  bc:	e8 ab 05 00 00       	call   66c <setgid>
  gid = getgid();
  c1:	e8 8e 05 00 00       	call   654 <getgid>
  printf(1, "Current GID is: %d\n", gid);
  c6:	83 c4 0c             	add    $0xc,%esp
  c9:	50                   	push   %eax
  ca:	68 1b 0a 00 00       	push   $0xa1b
  cf:	6a 01                	push   $0x1
  d1:	e8 47 06 00 00       	call   71d <printf>
  sleep(5 * TPS);  // now type control-p
  d6:	c7 04 24 88 13 00 00 	movl   $0x1388,(%esp)
  dd:	e8 4a 05 00 00       	call   62c <sleep>
}
  e2:	83 c4 10             	add    $0x10,%esp
  e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  e8:	c9                   	leave  
  e9:	c3                   	ret    
    printf(2, "Error. Invalid GID: %d\n", nval);
  ea:	83 ec 04             	sub    $0x4,%esp
  ed:	53                   	push   %ebx
  ee:	68 42 0a 00 00       	push   $0xa42
  f3:	6a 02                	push   $0x2
  f5:	e8 23 06 00 00       	call   71d <printf>
  fa:	83 c4 10             	add    $0x10,%esp
  fd:	eb b9                	jmp    b8 <gidTest+0x3d>

000000ff <invalidTest>:
    pid = wait();
}

static void
invalidTest(uint nval)
{
  ff:	55                   	push   %ebp
 100:	89 e5                	mov    %esp,%ebp
 102:	53                   	push   %ebx
 103:	83 ec 08             	sub    $0x8,%esp
 106:	89 c3                	mov    %eax,%ebx
  printf(1, "Setting UID to %d. This test should FAIL\n", nval);
 108:	50                   	push   %eax
 109:	68 7c 0a 00 00       	push   $0xa7c
 10e:	6a 01                	push   $0x1
 110:	e8 08 06 00 00       	call   71d <printf>
  if (setuid(nval) < 0)
 115:	89 1c 24             	mov    %ebx,(%esp)
 118:	e8 47 05 00 00       	call   664 <setuid>
 11d:	83 c4 10             	add    $0x10,%esp
 120:	85 c0                	test   %eax,%eax
 122:	78 7e                	js     1a2 <invalidTest+0xa3>
    printf(1, "SUCCESS! The setuid system call indicated failure\n");
  else
    printf(2, "FAILURE! The setuid system call indicates success\n");
 124:	83 ec 08             	sub    $0x8,%esp
 127:	68 dc 0a 00 00       	push   $0xadc
 12c:	6a 02                	push   $0x2
 12e:	e8 ea 05 00 00       	call   71d <printf>
 133:	83 c4 10             	add    $0x10,%esp

  printf(1, "Setting GID to %d. This test should FAIL\n", nval);
 136:	83 ec 04             	sub    $0x4,%esp
 139:	53                   	push   %ebx
 13a:	68 10 0b 00 00       	push   $0xb10
 13f:	6a 01                	push   $0x1
 141:	e8 d7 05 00 00       	call   71d <printf>
  if (setgid(nval) < 0)
 146:	89 1c 24             	mov    %ebx,(%esp)
 149:	e8 1e 05 00 00       	call   66c <setgid>
 14e:	83 c4 10             	add    $0x10,%esp
 151:	85 c0                	test   %eax,%eax
 153:	78 61                	js     1b6 <invalidTest+0xb7>
    printf(1, "SUCCESS! The setgid system call indicated failure\n");
  else
    printf(2, "FAILURE! The setgid system call indicates success\n");
 155:	83 ec 08             	sub    $0x8,%esp
 158:	68 70 0b 00 00       	push   $0xb70
 15d:	6a 02                	push   $0x2
 15f:	e8 b9 05 00 00       	call   71d <printf>
 164:	83 c4 10             	add    $0x10,%esp

  printf(1, "Setting UID to %d. This test should FAIL\n", -1);
 167:	83 ec 04             	sub    $0x4,%esp
 16a:	6a ff                	push   $0xffffffff
 16c:	68 7c 0a 00 00       	push   $0xa7c
 171:	6a 01                	push   $0x1
 173:	e8 a5 05 00 00       	call   71d <printf>
  if (setuid(-1) < 0)
 178:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 17f:	e8 e0 04 00 00       	call   664 <setuid>
 184:	83 c4 10             	add    $0x10,%esp
 187:	85 c0                	test   %eax,%eax
 189:	78 3f                	js     1ca <invalidTest+0xcb>
    printf(1, "SUCCESS! The setuid system call indicated failure\n");
  else
    printf(2, "FAILURE! The setgid system call indicates success\n");
 18b:	83 ec 08             	sub    $0x8,%esp
 18e:	68 70 0b 00 00       	push   $0xb70
 193:	6a 02                	push   $0x2
 195:	e8 83 05 00 00       	call   71d <printf>
 19a:	83 c4 10             	add    $0x10,%esp
}
 19d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a0:	c9                   	leave  
 1a1:	c3                   	ret    
    printf(1, "SUCCESS! The setuid system call indicated failure\n");
 1a2:	83 ec 08             	sub    $0x8,%esp
 1a5:	68 a8 0a 00 00       	push   $0xaa8
 1aa:	6a 01                	push   $0x1
 1ac:	e8 6c 05 00 00       	call   71d <printf>
 1b1:	83 c4 10             	add    $0x10,%esp
 1b4:	eb 80                	jmp    136 <invalidTest+0x37>
    printf(1, "SUCCESS! The setgid system call indicated failure\n");
 1b6:	83 ec 08             	sub    $0x8,%esp
 1b9:	68 3c 0b 00 00       	push   $0xb3c
 1be:	6a 01                	push   $0x1
 1c0:	e8 58 05 00 00       	call   71d <printf>
 1c5:	83 c4 10             	add    $0x10,%esp
 1c8:	eb 9d                	jmp    167 <invalidTest+0x68>
    printf(1, "SUCCESS! The setuid system call indicated failure\n");
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	68 a8 0a 00 00       	push   $0xaa8
 1d2:	6a 01                	push   $0x1
 1d4:	e8 44 05 00 00       	call   71d <printf>
 1d9:	83 c4 10             	add    $0x10,%esp
 1dc:	eb bf                	jmp    19d <invalidTest+0x9e>

000001de <forkTest>:
{
 1de:	55                   	push   %ebp
 1df:	89 e5                	mov    %esp,%ebp
 1e1:	53                   	push   %ebx
 1e2:	83 ec 04             	sub    $0x4,%esp
 1e5:	89 c3                	mov    %eax,%ebx
  printf(1, "Setting UID to %d and GID to %d before fork(). Value"
 1e7:	50                   	push   %eax
 1e8:	50                   	push   %eax
 1e9:	68 a4 0b 00 00       	push   $0xba4
 1ee:	6a 01                	push   $0x1
 1f0:	e8 28 05 00 00       	call   71d <printf>
  if (setuid(nval) < 0)
 1f5:	89 1c 24             	mov    %ebx,(%esp)
 1f8:	e8 67 04 00 00       	call   664 <setuid>
 1fd:	83 c4 10             	add    $0x10,%esp
 200:	85 c0                	test   %eax,%eax
 202:	78 40                	js     244 <forkTest+0x66>
  if (setgid(nval) < 0)
 204:	83 ec 0c             	sub    $0xc,%esp
 207:	53                   	push   %ebx
 208:	e8 5f 04 00 00       	call   66c <setgid>
 20d:	83 c4 10             	add    $0x10,%esp
 210:	85 c0                	test   %eax,%eax
 212:	78 45                	js     259 <forkTest+0x7b>
  printf(1, "Before fork(), UID = %d, GID = %d\n", getuid(), getgid());
 214:	e8 3b 04 00 00       	call   654 <getgid>
 219:	89 c3                	mov    %eax,%ebx
 21b:	e8 2c 04 00 00       	call   64c <getuid>
 220:	53                   	push   %ebx
 221:	50                   	push   %eax
 222:	68 f0 0b 00 00       	push   $0xbf0
 227:	6a 01                	push   $0x1
 229:	e8 ef 04 00 00       	call   71d <printf>
  pid = fork();
 22e:	e8 61 03 00 00       	call   594 <fork>
  if (pid == 0) {  // child
 233:	83 c4 10             	add    $0x10,%esp
 236:	85 c0                	test   %eax,%eax
 238:	74 34                	je     26e <forkTest+0x90>
    pid = wait();
 23a:	e8 65 03 00 00       	call   5a4 <wait>
}
 23f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 242:	c9                   	leave  
 243:	c3                   	ret    
    printf(2, "Error. Invalid UID: %d\n", nval);
 244:	83 ec 04             	sub    $0x4,%esp
 247:	53                   	push   %ebx
 248:	68 03 0a 00 00       	push   $0xa03
 24d:	6a 02                	push   $0x2
 24f:	e8 c9 04 00 00       	call   71d <printf>
 254:	83 c4 10             	add    $0x10,%esp
 257:	eb ab                	jmp    204 <forkTest+0x26>
    printf(2, "Error. Invalid UID: %d\n", nval);
 259:	83 ec 04             	sub    $0x4,%esp
 25c:	53                   	push   %ebx
 25d:	68 03 0a 00 00       	push   $0xa03
 262:	6a 02                	push   $0x2
 264:	e8 b4 04 00 00       	call   71d <printf>
 269:	83 c4 10             	add    $0x10,%esp
 26c:	eb a6                	jmp    214 <forkTest+0x36>
    uid = getuid();
 26e:	e8 d9 03 00 00       	call   64c <getuid>
 273:	89 c3                	mov    %eax,%ebx
    gid = getgid();
 275:	e8 da 03 00 00       	call   654 <getgid>
    printf(1, "Child: UID is: %d, GID is: %d\n", uid, gid);
 27a:	50                   	push   %eax
 27b:	53                   	push   %ebx
 27c:	68 14 0c 00 00       	push   $0xc14
 281:	6a 01                	push   $0x1
 283:	e8 95 04 00 00       	call   71d <printf>
    sleep(5 * TPS);  // now type control-p
 288:	c7 04 24 88 13 00 00 	movl   $0x1388,(%esp)
 28f:	e8 98 03 00 00       	call   62c <sleep>
    exit();
 294:	e8 03 03 00 00       	call   59c <exit>

00000299 <testuidgid>:

static int
testuidgid(void)
{
 299:	55                   	push   %ebp
 29a:	89 e5                	mov    %esp,%ebp
 29c:	83 ec 08             	sub    $0x8,%esp
  uint nval, ppid;

  // get/set uid test
  nval = 100;
  uidTest(nval);
 29f:	b8 64 00 00 00       	mov    $0x64,%eax
 2a4:	e8 57 fd ff ff       	call   0 <uidTest>

  // get/set gid test
  nval = 200;
  gidTest(nval);
 2a9:	b8 c8 00 00 00       	mov    $0xc8,%eax
 2ae:	e8 c8 fd ff ff       	call   7b <gidTest>

  // getppid test
  ppid = getppid();
 2b3:	e8 a4 03 00 00       	call   65c <getppid>
  printf(1, "My parent process is: %d\n", ppid);
 2b8:	83 ec 04             	sub    $0x4,%esp
 2bb:	50                   	push   %eax
 2bc:	68 5a 0a 00 00       	push   $0xa5a
 2c1:	6a 01                	push   $0x1
 2c3:	e8 55 04 00 00       	call   71d <printf>

  // fork tests to demonstrate UID/GID inheritance
  nval = 111;
  forkTest(nval);
 2c8:	b8 6f 00 00 00       	mov    $0x6f,%eax
 2cd:	e8 0c ff ff ff       	call   1de <forkTest>

  // tests for invalid values for uid and gid
  nval = 32800;   // 32767 is max value
  invalidTest(nval);
 2d2:	b8 20 80 00 00       	mov    $0x8020,%eax
 2d7:	e8 23 fe ff ff       	call   ff <invalidTest>

  printf(1, "Done!\n");
 2dc:	83 c4 08             	add    $0x8,%esp
 2df:	68 74 0a 00 00       	push   $0xa74
 2e4:	6a 01                	push   $0x1
 2e6:	e8 32 04 00 00       	call   71d <printf>
  return 0;
}
 2eb:	b8 00 00 00 00       	mov    $0x0,%eax
 2f0:	c9                   	leave  
 2f1:	c3                   	ret    

000002f2 <main>:

int
main() {
 2f2:	f3 0f 1e fb          	endbr32 
 2f6:	55                   	push   %ebp
 2f7:	89 e5                	mov    %esp,%ebp
 2f9:	83 e4 f0             	and    $0xfffffff0,%esp
  testuidgid();
 2fc:	e8 98 ff ff ff       	call   299 <testuidgid>
  exit();
 301:	e8 96 02 00 00       	call   59c <exit>

00000306 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 306:	f3 0f 1e fb          	endbr32 
 30a:	55                   	push   %ebp
 30b:	89 e5                	mov    %esp,%ebp
 30d:	56                   	push   %esi
 30e:	53                   	push   %ebx
 30f:	8b 75 08             	mov    0x8(%ebp),%esi
 312:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 315:	89 f0                	mov    %esi,%eax
 317:	89 d1                	mov    %edx,%ecx
 319:	83 c2 01             	add    $0x1,%edx
 31c:	89 c3                	mov    %eax,%ebx
 31e:	83 c0 01             	add    $0x1,%eax
 321:	0f b6 09             	movzbl (%ecx),%ecx
 324:	88 0b                	mov    %cl,(%ebx)
 326:	84 c9                	test   %cl,%cl
 328:	75 ed                	jne    317 <strcpy+0x11>
    ;
  return os;
}
 32a:	89 f0                	mov    %esi,%eax
 32c:	5b                   	pop    %ebx
 32d:	5e                   	pop    %esi
 32e:	5d                   	pop    %ebp
 32f:	c3                   	ret    

00000330 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	8b 4d 08             	mov    0x8(%ebp),%ecx
 33a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 33d:	0f b6 01             	movzbl (%ecx),%eax
 340:	84 c0                	test   %al,%al
 342:	74 0c                	je     350 <strcmp+0x20>
 344:	3a 02                	cmp    (%edx),%al
 346:	75 08                	jne    350 <strcmp+0x20>
    p++, q++;
 348:	83 c1 01             	add    $0x1,%ecx
 34b:	83 c2 01             	add    $0x1,%edx
 34e:	eb ed                	jmp    33d <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 350:	0f b6 c0             	movzbl %al,%eax
 353:	0f b6 12             	movzbl (%edx),%edx
 356:	29 d0                	sub    %edx,%eax
}
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    

0000035a <strlen>:

uint
strlen(char *s)
{
 35a:	f3 0f 1e fb          	endbr32 
 35e:	55                   	push   %ebp
 35f:	89 e5                	mov    %esp,%ebp
 361:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 364:	b8 00 00 00 00       	mov    $0x0,%eax
 369:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 36d:	74 05                	je     374 <strlen+0x1a>
 36f:	83 c0 01             	add    $0x1,%eax
 372:	eb f5                	jmp    369 <strlen+0xf>
    ;
  return n;
}
 374:	5d                   	pop    %ebp
 375:	c3                   	ret    

00000376 <memset>:

void*
memset(void *dst, int c, uint n)
{
 376:	f3 0f 1e fb          	endbr32 
 37a:	55                   	push   %ebp
 37b:	89 e5                	mov    %esp,%ebp
 37d:	57                   	push   %edi
 37e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 381:	89 d7                	mov    %edx,%edi
 383:	8b 4d 10             	mov    0x10(%ebp),%ecx
 386:	8b 45 0c             	mov    0xc(%ebp),%eax
 389:	fc                   	cld    
 38a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 38c:	89 d0                	mov    %edx,%eax
 38e:	5f                   	pop    %edi
 38f:	5d                   	pop    %ebp
 390:	c3                   	ret    

00000391 <strchr>:

char*
strchr(const char *s, char c)
{
 391:	f3 0f 1e fb          	endbr32 
 395:	55                   	push   %ebp
 396:	89 e5                	mov    %esp,%ebp
 398:	8b 45 08             	mov    0x8(%ebp),%eax
 39b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 39f:	0f b6 10             	movzbl (%eax),%edx
 3a2:	84 d2                	test   %dl,%dl
 3a4:	74 09                	je     3af <strchr+0x1e>
    if(*s == c)
 3a6:	38 ca                	cmp    %cl,%dl
 3a8:	74 0a                	je     3b4 <strchr+0x23>
  for(; *s; s++)
 3aa:	83 c0 01             	add    $0x1,%eax
 3ad:	eb f0                	jmp    39f <strchr+0xe>
      return (char*)s;
  return 0;
 3af:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3b4:	5d                   	pop    %ebp
 3b5:	c3                   	ret    

000003b6 <gets>:

char*
gets(char *buf, int max)
{
 3b6:	f3 0f 1e fb          	endbr32 
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	57                   	push   %edi
 3be:	56                   	push   %esi
 3bf:	53                   	push   %ebx
 3c0:	83 ec 1c             	sub    $0x1c,%esp
 3c3:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3c6:	bb 00 00 00 00       	mov    $0x0,%ebx
 3cb:	89 de                	mov    %ebx,%esi
 3cd:	83 c3 01             	add    $0x1,%ebx
 3d0:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3d3:	7d 2e                	jge    403 <gets+0x4d>
    cc = read(0, &c, 1);
 3d5:	83 ec 04             	sub    $0x4,%esp
 3d8:	6a 01                	push   $0x1
 3da:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3dd:	50                   	push   %eax
 3de:	6a 00                	push   $0x0
 3e0:	e8 cf 01 00 00       	call   5b4 <read>
    if(cc < 1)
 3e5:	83 c4 10             	add    $0x10,%esp
 3e8:	85 c0                	test   %eax,%eax
 3ea:	7e 17                	jle    403 <gets+0x4d>
      break;
    buf[i++] = c;
 3ec:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3f0:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3f3:	3c 0a                	cmp    $0xa,%al
 3f5:	0f 94 c2             	sete   %dl
 3f8:	3c 0d                	cmp    $0xd,%al
 3fa:	0f 94 c0             	sete   %al
 3fd:	08 c2                	or     %al,%dl
 3ff:	74 ca                	je     3cb <gets+0x15>
    buf[i++] = c;
 401:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 403:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 407:	89 f8                	mov    %edi,%eax
 409:	8d 65 f4             	lea    -0xc(%ebp),%esp
 40c:	5b                   	pop    %ebx
 40d:	5e                   	pop    %esi
 40e:	5f                   	pop    %edi
 40f:	5d                   	pop    %ebp
 410:	c3                   	ret    

00000411 <stat>:

int
stat(char *n, struct stat *st)
{
 411:	f3 0f 1e fb          	endbr32 
 415:	55                   	push   %ebp
 416:	89 e5                	mov    %esp,%ebp
 418:	56                   	push   %esi
 419:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 41a:	83 ec 08             	sub    $0x8,%esp
 41d:	6a 00                	push   $0x0
 41f:	ff 75 08             	pushl  0x8(%ebp)
 422:	e8 b5 01 00 00       	call   5dc <open>
  if(fd < 0)
 427:	83 c4 10             	add    $0x10,%esp
 42a:	85 c0                	test   %eax,%eax
 42c:	78 24                	js     452 <stat+0x41>
 42e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 430:	83 ec 08             	sub    $0x8,%esp
 433:	ff 75 0c             	pushl  0xc(%ebp)
 436:	50                   	push   %eax
 437:	e8 b8 01 00 00       	call   5f4 <fstat>
 43c:	89 c6                	mov    %eax,%esi
  close(fd);
 43e:	89 1c 24             	mov    %ebx,(%esp)
 441:	e8 7e 01 00 00       	call   5c4 <close>
  return r;
 446:	83 c4 10             	add    $0x10,%esp
}
 449:	89 f0                	mov    %esi,%eax
 44b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 44e:	5b                   	pop    %ebx
 44f:	5e                   	pop    %esi
 450:	5d                   	pop    %ebp
 451:	c3                   	ret    
    return -1;
 452:	be ff ff ff ff       	mov    $0xffffffff,%esi
 457:	eb f0                	jmp    449 <stat+0x38>

00000459 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 459:	f3 0f 1e fb          	endbr32 
 45d:	55                   	push   %ebp
 45e:	89 e5                	mov    %esp,%ebp
 460:	57                   	push   %edi
 461:	56                   	push   %esi
 462:	53                   	push   %ebx
 463:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 466:	0f b6 02             	movzbl (%edx),%eax
 469:	3c 20                	cmp    $0x20,%al
 46b:	75 05                	jne    472 <atoi+0x19>
 46d:	83 c2 01             	add    $0x1,%edx
 470:	eb f4                	jmp    466 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 472:	3c 2d                	cmp    $0x2d,%al
 474:	74 1d                	je     493 <atoi+0x3a>
 476:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 47b:	3c 2b                	cmp    $0x2b,%al
 47d:	0f 94 c1             	sete   %cl
 480:	3c 2d                	cmp    $0x2d,%al
 482:	0f 94 c0             	sete   %al
 485:	08 c1                	or     %al,%cl
 487:	74 03                	je     48c <atoi+0x33>
    s++;
 489:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 48c:	b8 00 00 00 00       	mov    $0x0,%eax
 491:	eb 17                	jmp    4aa <atoi+0x51>
 493:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 498:	eb e1                	jmp    47b <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 49a:	8d 34 80             	lea    (%eax,%eax,4),%esi
 49d:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 4a0:	83 c2 01             	add    $0x1,%edx
 4a3:	0f be c9             	movsbl %cl,%ecx
 4a6:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 4aa:	0f b6 0a             	movzbl (%edx),%ecx
 4ad:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 4b0:	80 fb 09             	cmp    $0x9,%bl
 4b3:	76 e5                	jbe    49a <atoi+0x41>
  return sign*n;
 4b5:	0f af c7             	imul   %edi,%eax
}
 4b8:	5b                   	pop    %ebx
 4b9:	5e                   	pop    %esi
 4ba:	5f                   	pop    %edi
 4bb:	5d                   	pop    %ebp
 4bc:	c3                   	ret    

000004bd <atoo>:

int
atoo(const char *s)
{
 4bd:	f3 0f 1e fb          	endbr32 
 4c1:	55                   	push   %ebp
 4c2:	89 e5                	mov    %esp,%ebp
 4c4:	57                   	push   %edi
 4c5:	56                   	push   %esi
 4c6:	53                   	push   %ebx
 4c7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 4ca:	0f b6 0a             	movzbl (%edx),%ecx
 4cd:	80 f9 20             	cmp    $0x20,%cl
 4d0:	75 05                	jne    4d7 <atoo+0x1a>
 4d2:	83 c2 01             	add    $0x1,%edx
 4d5:	eb f3                	jmp    4ca <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 4d7:	80 f9 2d             	cmp    $0x2d,%cl
 4da:	74 23                	je     4ff <atoo+0x42>
 4dc:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 4e1:	80 f9 2b             	cmp    $0x2b,%cl
 4e4:	0f 94 c0             	sete   %al
 4e7:	89 c6                	mov    %eax,%esi
 4e9:	80 f9 2d             	cmp    $0x2d,%cl
 4ec:	0f 94 c0             	sete   %al
 4ef:	89 f3                	mov    %esi,%ebx
 4f1:	08 c3                	or     %al,%bl
 4f3:	74 03                	je     4f8 <atoo+0x3b>
    s++;
 4f5:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 4f8:	b8 00 00 00 00       	mov    $0x0,%eax
 4fd:	eb 11                	jmp    510 <atoo+0x53>
 4ff:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 504:	eb db                	jmp    4e1 <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 506:	83 c2 01             	add    $0x1,%edx
 509:	0f be c9             	movsbl %cl,%ecx
 50c:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 510:	0f b6 0a             	movzbl (%edx),%ecx
 513:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 516:	80 fb 07             	cmp    $0x7,%bl
 519:	76 eb                	jbe    506 <atoo+0x49>
  return sign*n;
 51b:	0f af c7             	imul   %edi,%eax
}
 51e:	5b                   	pop    %ebx
 51f:	5e                   	pop    %esi
 520:	5f                   	pop    %edi
 521:	5d                   	pop    %ebp
 522:	c3                   	ret    

00000523 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 523:	f3 0f 1e fb          	endbr32 
 527:	55                   	push   %ebp
 528:	89 e5                	mov    %esp,%ebp
 52a:	53                   	push   %ebx
 52b:	8b 55 08             	mov    0x8(%ebp),%edx
 52e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 531:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 534:	eb 09                	jmp    53f <strncmp+0x1c>
      n--, p++, q++;
 536:	83 e8 01             	sub    $0x1,%eax
 539:	83 c2 01             	add    $0x1,%edx
 53c:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 53f:	85 c0                	test   %eax,%eax
 541:	74 0b                	je     54e <strncmp+0x2b>
 543:	0f b6 1a             	movzbl (%edx),%ebx
 546:	84 db                	test   %bl,%bl
 548:	74 04                	je     54e <strncmp+0x2b>
 54a:	3a 19                	cmp    (%ecx),%bl
 54c:	74 e8                	je     536 <strncmp+0x13>
    if(n == 0)
 54e:	85 c0                	test   %eax,%eax
 550:	74 0b                	je     55d <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 552:	0f b6 02             	movzbl (%edx),%eax
 555:	0f b6 11             	movzbl (%ecx),%edx
 558:	29 d0                	sub    %edx,%eax
}
 55a:	5b                   	pop    %ebx
 55b:	5d                   	pop    %ebp
 55c:	c3                   	ret    
      return 0;
 55d:	b8 00 00 00 00       	mov    $0x0,%eax
 562:	eb f6                	jmp    55a <strncmp+0x37>

00000564 <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 564:	f3 0f 1e fb          	endbr32 
 568:	55                   	push   %ebp
 569:	89 e5                	mov    %esp,%ebp
 56b:	56                   	push   %esi
 56c:	53                   	push   %ebx
 56d:	8b 75 08             	mov    0x8(%ebp),%esi
 570:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 573:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 576:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 578:	8d 58 ff             	lea    -0x1(%eax),%ebx
 57b:	85 c0                	test   %eax,%eax
 57d:	7e 0f                	jle    58e <memmove+0x2a>
    *dst++ = *src++;
 57f:	0f b6 01             	movzbl (%ecx),%eax
 582:	88 02                	mov    %al,(%edx)
 584:	8d 49 01             	lea    0x1(%ecx),%ecx
 587:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 58a:	89 d8                	mov    %ebx,%eax
 58c:	eb ea                	jmp    578 <memmove+0x14>
  return vdst;
}
 58e:	89 f0                	mov    %esi,%eax
 590:	5b                   	pop    %ebx
 591:	5e                   	pop    %esi
 592:	5d                   	pop    %ebp
 593:	c3                   	ret    

00000594 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 594:	b8 01 00 00 00       	mov    $0x1,%eax
 599:	cd 40                	int    $0x40
 59b:	c3                   	ret    

0000059c <exit>:
SYSCALL(exit)
 59c:	b8 02 00 00 00       	mov    $0x2,%eax
 5a1:	cd 40                	int    $0x40
 5a3:	c3                   	ret    

000005a4 <wait>:
SYSCALL(wait)
 5a4:	b8 03 00 00 00       	mov    $0x3,%eax
 5a9:	cd 40                	int    $0x40
 5ab:	c3                   	ret    

000005ac <pipe>:
SYSCALL(pipe)
 5ac:	b8 04 00 00 00       	mov    $0x4,%eax
 5b1:	cd 40                	int    $0x40
 5b3:	c3                   	ret    

000005b4 <read>:
SYSCALL(read)
 5b4:	b8 05 00 00 00       	mov    $0x5,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <write>:
SYSCALL(write)
 5bc:	b8 10 00 00 00       	mov    $0x10,%eax
 5c1:	cd 40                	int    $0x40
 5c3:	c3                   	ret    

000005c4 <close>:
SYSCALL(close)
 5c4:	b8 15 00 00 00       	mov    $0x15,%eax
 5c9:	cd 40                	int    $0x40
 5cb:	c3                   	ret    

000005cc <kill>:
SYSCALL(kill)
 5cc:	b8 06 00 00 00       	mov    $0x6,%eax
 5d1:	cd 40                	int    $0x40
 5d3:	c3                   	ret    

000005d4 <exec>:
SYSCALL(exec)
 5d4:	b8 07 00 00 00       	mov    $0x7,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <open>:
SYSCALL(open)
 5dc:	b8 0f 00 00 00       	mov    $0xf,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <mknod>:
SYSCALL(mknod)
 5e4:	b8 11 00 00 00       	mov    $0x11,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <unlink>:
SYSCALL(unlink)
 5ec:	b8 12 00 00 00       	mov    $0x12,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <fstat>:
SYSCALL(fstat)
 5f4:	b8 08 00 00 00       	mov    $0x8,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <link>:
SYSCALL(link)
 5fc:	b8 13 00 00 00       	mov    $0x13,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <mkdir>:
SYSCALL(mkdir)
 604:	b8 14 00 00 00       	mov    $0x14,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <chdir>:
SYSCALL(chdir)
 60c:	b8 09 00 00 00       	mov    $0x9,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <dup>:
SYSCALL(dup)
 614:	b8 0a 00 00 00       	mov    $0xa,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <getpid>:
SYSCALL(getpid)
 61c:	b8 0b 00 00 00       	mov    $0xb,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <sbrk>:
SYSCALL(sbrk)
 624:	b8 0c 00 00 00       	mov    $0xc,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <sleep>:
SYSCALL(sleep)
 62c:	b8 0d 00 00 00       	mov    $0xd,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    

00000634 <uptime>:
SYSCALL(uptime)
 634:	b8 0e 00 00 00       	mov    $0xe,%eax
 639:	cd 40                	int    $0x40
 63b:	c3                   	ret    

0000063c <halt>:
SYSCALL(halt)
 63c:	b8 16 00 00 00       	mov    $0x16,%eax
 641:	cd 40                	int    $0x40
 643:	c3                   	ret    

00000644 <date>:
SYSCALL(date)
 644:	b8 17 00 00 00       	mov    $0x17,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <getuid>:
SYSCALL(getuid)
 64c:	b8 18 00 00 00       	mov    $0x18,%eax
 651:	cd 40                	int    $0x40
 653:	c3                   	ret    

00000654 <getgid>:
SYSCALL(getgid)
 654:	b8 19 00 00 00       	mov    $0x19,%eax
 659:	cd 40                	int    $0x40
 65b:	c3                   	ret    

0000065c <getppid>:
SYSCALL(getppid)
 65c:	b8 1a 00 00 00       	mov    $0x1a,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <setuid>:
SYSCALL(setuid)
 664:	b8 1b 00 00 00       	mov    $0x1b,%eax
 669:	cd 40                	int    $0x40
 66b:	c3                   	ret    

0000066c <setgid>:
SYSCALL(setgid)
 66c:	b8 1c 00 00 00       	mov    $0x1c,%eax
 671:	cd 40                	int    $0x40
 673:	c3                   	ret    

00000674 <getprocs>:
 674:	b8 1d 00 00 00       	mov    $0x1d,%eax
 679:	cd 40                	int    $0x40
 67b:	c3                   	ret    

0000067c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 67c:	55                   	push   %ebp
 67d:	89 e5                	mov    %esp,%ebp
 67f:	83 ec 1c             	sub    $0x1c,%esp
 682:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 685:	6a 01                	push   $0x1
 687:	8d 55 f4             	lea    -0xc(%ebp),%edx
 68a:	52                   	push   %edx
 68b:	50                   	push   %eax
 68c:	e8 2b ff ff ff       	call   5bc <write>
}
 691:	83 c4 10             	add    $0x10,%esp
 694:	c9                   	leave  
 695:	c3                   	ret    

00000696 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 696:	55                   	push   %ebp
 697:	89 e5                	mov    %esp,%ebp
 699:	57                   	push   %edi
 69a:	56                   	push   %esi
 69b:	53                   	push   %ebx
 69c:	83 ec 2c             	sub    $0x2c,%esp
 69f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6a2:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6a4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6a8:	0f 95 c2             	setne  %dl
 6ab:	89 f0                	mov    %esi,%eax
 6ad:	c1 e8 1f             	shr    $0x1f,%eax
 6b0:	84 c2                	test   %al,%dl
 6b2:	74 42                	je     6f6 <printint+0x60>
    neg = 1;
    x = -xx;
 6b4:	f7 de                	neg    %esi
    neg = 1;
 6b6:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6bd:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6c2:	89 f0                	mov    %esi,%eax
 6c4:	ba 00 00 00 00       	mov    $0x0,%edx
 6c9:	f7 f1                	div    %ecx
 6cb:	89 df                	mov    %ebx,%edi
 6cd:	83 c3 01             	add    $0x1,%ebx
 6d0:	0f b6 92 3c 0c 00 00 	movzbl 0xc3c(%edx),%edx
 6d7:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6db:	89 f2                	mov    %esi,%edx
 6dd:	89 c6                	mov    %eax,%esi
 6df:	39 d1                	cmp    %edx,%ecx
 6e1:	76 df                	jbe    6c2 <printint+0x2c>
  if(neg)
 6e3:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6e7:	74 2f                	je     718 <printint+0x82>
    buf[i++] = '-';
 6e9:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6ee:	8d 5f 02             	lea    0x2(%edi),%ebx
 6f1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6f4:	eb 15                	jmp    70b <printint+0x75>
  neg = 0;
 6f6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6fd:	eb be                	jmp    6bd <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 6ff:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 704:	89 f0                	mov    %esi,%eax
 706:	e8 71 ff ff ff       	call   67c <putc>
  while(--i >= 0)
 70b:	83 eb 01             	sub    $0x1,%ebx
 70e:	79 ef                	jns    6ff <printint+0x69>
}
 710:	83 c4 2c             	add    $0x2c,%esp
 713:	5b                   	pop    %ebx
 714:	5e                   	pop    %esi
 715:	5f                   	pop    %edi
 716:	5d                   	pop    %ebp
 717:	c3                   	ret    
 718:	8b 75 d0             	mov    -0x30(%ebp),%esi
 71b:	eb ee                	jmp    70b <printint+0x75>

0000071d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 71d:	f3 0f 1e fb          	endbr32 
 721:	55                   	push   %ebp
 722:	89 e5                	mov    %esp,%ebp
 724:	57                   	push   %edi
 725:	56                   	push   %esi
 726:	53                   	push   %ebx
 727:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 72a:	8d 45 10             	lea    0x10(%ebp),%eax
 72d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 730:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 735:	bb 00 00 00 00       	mov    $0x0,%ebx
 73a:	eb 14                	jmp    750 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 73c:	89 fa                	mov    %edi,%edx
 73e:	8b 45 08             	mov    0x8(%ebp),%eax
 741:	e8 36 ff ff ff       	call   67c <putc>
 746:	eb 05                	jmp    74d <printf+0x30>
      }
    } else if(state == '%'){
 748:	83 fe 25             	cmp    $0x25,%esi
 74b:	74 25                	je     772 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 74d:	83 c3 01             	add    $0x1,%ebx
 750:	8b 45 0c             	mov    0xc(%ebp),%eax
 753:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 757:	84 c0                	test   %al,%al
 759:	0f 84 23 01 00 00    	je     882 <printf+0x165>
    c = fmt[i] & 0xff;
 75f:	0f be f8             	movsbl %al,%edi
 762:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 765:	85 f6                	test   %esi,%esi
 767:	75 df                	jne    748 <printf+0x2b>
      if(c == '%'){
 769:	83 f8 25             	cmp    $0x25,%eax
 76c:	75 ce                	jne    73c <printf+0x1f>
        state = '%';
 76e:	89 c6                	mov    %eax,%esi
 770:	eb db                	jmp    74d <printf+0x30>
      if(c == 'd'){
 772:	83 f8 64             	cmp    $0x64,%eax
 775:	74 49                	je     7c0 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 777:	83 f8 78             	cmp    $0x78,%eax
 77a:	0f 94 c1             	sete   %cl
 77d:	83 f8 70             	cmp    $0x70,%eax
 780:	0f 94 c2             	sete   %dl
 783:	08 d1                	or     %dl,%cl
 785:	75 63                	jne    7ea <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 787:	83 f8 73             	cmp    $0x73,%eax
 78a:	0f 84 84 00 00 00    	je     814 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 790:	83 f8 63             	cmp    $0x63,%eax
 793:	0f 84 b7 00 00 00    	je     850 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 799:	83 f8 25             	cmp    $0x25,%eax
 79c:	0f 84 cc 00 00 00    	je     86e <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7a2:	ba 25 00 00 00       	mov    $0x25,%edx
 7a7:	8b 45 08             	mov    0x8(%ebp),%eax
 7aa:	e8 cd fe ff ff       	call   67c <putc>
        putc(fd, c);
 7af:	89 fa                	mov    %edi,%edx
 7b1:	8b 45 08             	mov    0x8(%ebp),%eax
 7b4:	e8 c3 fe ff ff       	call   67c <putc>
      }
      state = 0;
 7b9:	be 00 00 00 00       	mov    $0x0,%esi
 7be:	eb 8d                	jmp    74d <printf+0x30>
        printint(fd, *ap, 10, 1);
 7c0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7c3:	8b 17                	mov    (%edi),%edx
 7c5:	83 ec 0c             	sub    $0xc,%esp
 7c8:	6a 01                	push   $0x1
 7ca:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7cf:	8b 45 08             	mov    0x8(%ebp),%eax
 7d2:	e8 bf fe ff ff       	call   696 <printint>
        ap++;
 7d7:	83 c7 04             	add    $0x4,%edi
 7da:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7dd:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7e0:	be 00 00 00 00       	mov    $0x0,%esi
 7e5:	e9 63 ff ff ff       	jmp    74d <printf+0x30>
        printint(fd, *ap, 16, 0);
 7ea:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ed:	8b 17                	mov    (%edi),%edx
 7ef:	83 ec 0c             	sub    $0xc,%esp
 7f2:	6a 00                	push   $0x0
 7f4:	b9 10 00 00 00       	mov    $0x10,%ecx
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
 7fc:	e8 95 fe ff ff       	call   696 <printint>
        ap++;
 801:	83 c7 04             	add    $0x4,%edi
 804:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 807:	83 c4 10             	add    $0x10,%esp
      state = 0;
 80a:	be 00 00 00 00       	mov    $0x0,%esi
 80f:	e9 39 ff ff ff       	jmp    74d <printf+0x30>
        s = (char*)*ap;
 814:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 817:	8b 30                	mov    (%eax),%esi
        ap++;
 819:	83 c0 04             	add    $0x4,%eax
 81c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 81f:	85 f6                	test   %esi,%esi
 821:	75 28                	jne    84b <printf+0x12e>
          s = "(null)";
 823:	be 33 0c 00 00       	mov    $0xc33,%esi
 828:	8b 7d 08             	mov    0x8(%ebp),%edi
 82b:	eb 0d                	jmp    83a <printf+0x11d>
          putc(fd, *s);
 82d:	0f be d2             	movsbl %dl,%edx
 830:	89 f8                	mov    %edi,%eax
 832:	e8 45 fe ff ff       	call   67c <putc>
          s++;
 837:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 83a:	0f b6 16             	movzbl (%esi),%edx
 83d:	84 d2                	test   %dl,%dl
 83f:	75 ec                	jne    82d <printf+0x110>
      state = 0;
 841:	be 00 00 00 00       	mov    $0x0,%esi
 846:	e9 02 ff ff ff       	jmp    74d <printf+0x30>
 84b:	8b 7d 08             	mov    0x8(%ebp),%edi
 84e:	eb ea                	jmp    83a <printf+0x11d>
        putc(fd, *ap);
 850:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 853:	0f be 17             	movsbl (%edi),%edx
 856:	8b 45 08             	mov    0x8(%ebp),%eax
 859:	e8 1e fe ff ff       	call   67c <putc>
        ap++;
 85e:	83 c7 04             	add    $0x4,%edi
 861:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 864:	be 00 00 00 00       	mov    $0x0,%esi
 869:	e9 df fe ff ff       	jmp    74d <printf+0x30>
        putc(fd, c);
 86e:	89 fa                	mov    %edi,%edx
 870:	8b 45 08             	mov    0x8(%ebp),%eax
 873:	e8 04 fe ff ff       	call   67c <putc>
      state = 0;
 878:	be 00 00 00 00       	mov    $0x0,%esi
 87d:	e9 cb fe ff ff       	jmp    74d <printf+0x30>
    }
  }
}
 882:	8d 65 f4             	lea    -0xc(%ebp),%esp
 885:	5b                   	pop    %ebx
 886:	5e                   	pop    %esi
 887:	5f                   	pop    %edi
 888:	5d                   	pop    %ebp
 889:	c3                   	ret    

0000088a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 88a:	f3 0f 1e fb          	endbr32 
 88e:	55                   	push   %ebp
 88f:	89 e5                	mov    %esp,%ebp
 891:	57                   	push   %edi
 892:	56                   	push   %esi
 893:	53                   	push   %ebx
 894:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 897:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 89a:	a1 f0 0f 00 00       	mov    0xff0,%eax
 89f:	eb 02                	jmp    8a3 <free+0x19>
 8a1:	89 d0                	mov    %edx,%eax
 8a3:	39 c8                	cmp    %ecx,%eax
 8a5:	73 04                	jae    8ab <free+0x21>
 8a7:	39 08                	cmp    %ecx,(%eax)
 8a9:	77 12                	ja     8bd <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ab:	8b 10                	mov    (%eax),%edx
 8ad:	39 c2                	cmp    %eax,%edx
 8af:	77 f0                	ja     8a1 <free+0x17>
 8b1:	39 c8                	cmp    %ecx,%eax
 8b3:	72 08                	jb     8bd <free+0x33>
 8b5:	39 ca                	cmp    %ecx,%edx
 8b7:	77 04                	ja     8bd <free+0x33>
 8b9:	89 d0                	mov    %edx,%eax
 8bb:	eb e6                	jmp    8a3 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8bd:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8c0:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8c3:	8b 10                	mov    (%eax),%edx
 8c5:	39 d7                	cmp    %edx,%edi
 8c7:	74 19                	je     8e2 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8c9:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8cc:	8b 50 04             	mov    0x4(%eax),%edx
 8cf:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8d2:	39 ce                	cmp    %ecx,%esi
 8d4:	74 1b                	je     8f1 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8d6:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8d8:	a3 f0 0f 00 00       	mov    %eax,0xff0
}
 8dd:	5b                   	pop    %ebx
 8de:	5e                   	pop    %esi
 8df:	5f                   	pop    %edi
 8e0:	5d                   	pop    %ebp
 8e1:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8e2:	03 72 04             	add    0x4(%edx),%esi
 8e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8e8:	8b 10                	mov    (%eax),%edx
 8ea:	8b 12                	mov    (%edx),%edx
 8ec:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8ef:	eb db                	jmp    8cc <free+0x42>
    p->s.size += bp->s.size;
 8f1:	03 53 fc             	add    -0x4(%ebx),%edx
 8f4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8f7:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8fa:	89 10                	mov    %edx,(%eax)
 8fc:	eb da                	jmp    8d8 <free+0x4e>

000008fe <morecore>:

static Header*
morecore(uint nu)
{
 8fe:	55                   	push   %ebp
 8ff:	89 e5                	mov    %esp,%ebp
 901:	53                   	push   %ebx
 902:	83 ec 04             	sub    $0x4,%esp
 905:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 907:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 90c:	77 05                	ja     913 <morecore+0x15>
    nu = 4096;
 90e:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 913:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 91a:	83 ec 0c             	sub    $0xc,%esp
 91d:	50                   	push   %eax
 91e:	e8 01 fd ff ff       	call   624 <sbrk>
  if(p == (char*)-1)
 923:	83 c4 10             	add    $0x10,%esp
 926:	83 f8 ff             	cmp    $0xffffffff,%eax
 929:	74 1c                	je     947 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 92b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 92e:	83 c0 08             	add    $0x8,%eax
 931:	83 ec 0c             	sub    $0xc,%esp
 934:	50                   	push   %eax
 935:	e8 50 ff ff ff       	call   88a <free>
  return freep;
 93a:	a1 f0 0f 00 00       	mov    0xff0,%eax
 93f:	83 c4 10             	add    $0x10,%esp
}
 942:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 945:	c9                   	leave  
 946:	c3                   	ret    
    return 0;
 947:	b8 00 00 00 00       	mov    $0x0,%eax
 94c:	eb f4                	jmp    942 <morecore+0x44>

0000094e <malloc>:

void*
malloc(uint nbytes)
{
 94e:	f3 0f 1e fb          	endbr32 
 952:	55                   	push   %ebp
 953:	89 e5                	mov    %esp,%ebp
 955:	53                   	push   %ebx
 956:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 959:	8b 45 08             	mov    0x8(%ebp),%eax
 95c:	8d 58 07             	lea    0x7(%eax),%ebx
 95f:	c1 eb 03             	shr    $0x3,%ebx
 962:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 965:	8b 0d f0 0f 00 00    	mov    0xff0,%ecx
 96b:	85 c9                	test   %ecx,%ecx
 96d:	74 04                	je     973 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 96f:	8b 01                	mov    (%ecx),%eax
 971:	eb 4b                	jmp    9be <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 973:	c7 05 f0 0f 00 00 f4 	movl   $0xff4,0xff0
 97a:	0f 00 00 
 97d:	c7 05 f4 0f 00 00 f4 	movl   $0xff4,0xff4
 984:	0f 00 00 
    base.s.size = 0;
 987:	c7 05 f8 0f 00 00 00 	movl   $0x0,0xff8
 98e:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 991:	b9 f4 0f 00 00       	mov    $0xff4,%ecx
 996:	eb d7                	jmp    96f <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 998:	74 1a                	je     9b4 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 99a:	29 da                	sub    %ebx,%edx
 99c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 99f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9a2:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9a5:	89 0d f0 0f 00 00    	mov    %ecx,0xff0
      return (void*)(p + 1);
 9ab:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9ae:	83 c4 04             	add    $0x4,%esp
 9b1:	5b                   	pop    %ebx
 9b2:	5d                   	pop    %ebp
 9b3:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9b4:	8b 10                	mov    (%eax),%edx
 9b6:	89 11                	mov    %edx,(%ecx)
 9b8:	eb eb                	jmp    9a5 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ba:	89 c1                	mov    %eax,%ecx
 9bc:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9be:	8b 50 04             	mov    0x4(%eax),%edx
 9c1:	39 da                	cmp    %ebx,%edx
 9c3:	73 d3                	jae    998 <malloc+0x4a>
    if(p == freep)
 9c5:	39 05 f0 0f 00 00    	cmp    %eax,0xff0
 9cb:	75 ed                	jne    9ba <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 9cd:	89 d8                	mov    %ebx,%eax
 9cf:	e8 2a ff ff ff       	call   8fe <morecore>
 9d4:	85 c0                	test   %eax,%eax
 9d6:	75 e2                	jne    9ba <malloc+0x6c>
 9d8:	eb d4                	jmp    9ae <malloc+0x60>
