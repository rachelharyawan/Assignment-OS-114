
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	51                   	push   %ecx
  12:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  15:	e8 a6 02 00 00       	call   2c0 <fork>
  1a:	85 c0                	test   %eax,%eax
  1c:	7f 05                	jg     23 <main+0x23>
    sleep(5);  // Let child exit before parent.
  exit();
  1e:	e8 a5 02 00 00       	call   2c8 <exit>
    sleep(5);  // Let child exit before parent.
  23:	83 ec 0c             	sub    $0xc,%esp
  26:	6a 05                	push   $0x5
  28:	e8 2b 03 00 00       	call   358 <sleep>
  2d:	83 c4 10             	add    $0x10,%esp
  30:	eb ec                	jmp    1e <main+0x1e>

00000032 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  32:	f3 0f 1e fb          	endbr32 
  36:	55                   	push   %ebp
  37:	89 e5                	mov    %esp,%ebp
  39:	56                   	push   %esi
  3a:	53                   	push   %ebx
  3b:	8b 75 08             	mov    0x8(%ebp),%esi
  3e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  41:	89 f0                	mov    %esi,%eax
  43:	89 d1                	mov    %edx,%ecx
  45:	83 c2 01             	add    $0x1,%edx
  48:	89 c3                	mov    %eax,%ebx
  4a:	83 c0 01             	add    $0x1,%eax
  4d:	0f b6 09             	movzbl (%ecx),%ecx
  50:	88 0b                	mov    %cl,(%ebx)
  52:	84 c9                	test   %cl,%cl
  54:	75 ed                	jne    43 <strcpy+0x11>
    ;
  return os;
}
  56:	89 f0                	mov    %esi,%eax
  58:	5b                   	pop    %ebx
  59:	5e                   	pop    %esi
  5a:	5d                   	pop    %ebp
  5b:	c3                   	ret    

0000005c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  5c:	f3 0f 1e fb          	endbr32 
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	8b 4d 08             	mov    0x8(%ebp),%ecx
  66:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  69:	0f b6 01             	movzbl (%ecx),%eax
  6c:	84 c0                	test   %al,%al
  6e:	74 0c                	je     7c <strcmp+0x20>
  70:	3a 02                	cmp    (%edx),%al
  72:	75 08                	jne    7c <strcmp+0x20>
    p++, q++;
  74:	83 c1 01             	add    $0x1,%ecx
  77:	83 c2 01             	add    $0x1,%edx
  7a:	eb ed                	jmp    69 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
  7c:	0f b6 c0             	movzbl %al,%eax
  7f:	0f b6 12             	movzbl (%edx),%edx
  82:	29 d0                	sub    %edx,%eax
}
  84:	5d                   	pop    %ebp
  85:	c3                   	ret    

00000086 <strlen>:

uint
strlen(char *s)
{
  86:	f3 0f 1e fb          	endbr32 
  8a:	55                   	push   %ebp
  8b:	89 e5                	mov    %esp,%ebp
  8d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  90:	b8 00 00 00 00       	mov    $0x0,%eax
  95:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  99:	74 05                	je     a0 <strlen+0x1a>
  9b:	83 c0 01             	add    $0x1,%eax
  9e:	eb f5                	jmp    95 <strlen+0xf>
    ;
  return n;
}
  a0:	5d                   	pop    %ebp
  a1:	c3                   	ret    

000000a2 <memset>:

void*
memset(void *dst, int c, uint n)
{
  a2:	f3 0f 1e fb          	endbr32 
  a6:	55                   	push   %ebp
  a7:	89 e5                	mov    %esp,%ebp
  a9:	57                   	push   %edi
  aa:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  ad:	89 d7                	mov    %edx,%edi
  af:	8b 4d 10             	mov    0x10(%ebp),%ecx
  b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  b5:	fc                   	cld    
  b6:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  b8:	89 d0                	mov    %edx,%eax
  ba:	5f                   	pop    %edi
  bb:	5d                   	pop    %ebp
  bc:	c3                   	ret    

000000bd <strchr>:

char*
strchr(const char *s, char c)
{
  bd:	f3 0f 1e fb          	endbr32 
  c1:	55                   	push   %ebp
  c2:	89 e5                	mov    %esp,%ebp
  c4:	8b 45 08             	mov    0x8(%ebp),%eax
  c7:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  cb:	0f b6 10             	movzbl (%eax),%edx
  ce:	84 d2                	test   %dl,%dl
  d0:	74 09                	je     db <strchr+0x1e>
    if(*s == c)
  d2:	38 ca                	cmp    %cl,%dl
  d4:	74 0a                	je     e0 <strchr+0x23>
  for(; *s; s++)
  d6:	83 c0 01             	add    $0x1,%eax
  d9:	eb f0                	jmp    cb <strchr+0xe>
      return (char*)s;
  return 0;
  db:	b8 00 00 00 00       	mov    $0x0,%eax
}
  e0:	5d                   	pop    %ebp
  e1:	c3                   	ret    

000000e2 <gets>:

char*
gets(char *buf, int max)
{
  e2:	f3 0f 1e fb          	endbr32 
  e6:	55                   	push   %ebp
  e7:	89 e5                	mov    %esp,%ebp
  e9:	57                   	push   %edi
  ea:	56                   	push   %esi
  eb:	53                   	push   %ebx
  ec:	83 ec 1c             	sub    $0x1c,%esp
  ef:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
  f2:	bb 00 00 00 00       	mov    $0x0,%ebx
  f7:	89 de                	mov    %ebx,%esi
  f9:	83 c3 01             	add    $0x1,%ebx
  fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
  ff:	7d 2e                	jge    12f <gets+0x4d>
    cc = read(0, &c, 1);
 101:	83 ec 04             	sub    $0x4,%esp
 104:	6a 01                	push   $0x1
 106:	8d 45 e7             	lea    -0x19(%ebp),%eax
 109:	50                   	push   %eax
 10a:	6a 00                	push   $0x0
 10c:	e8 cf 01 00 00       	call   2e0 <read>
    if(cc < 1)
 111:	83 c4 10             	add    $0x10,%esp
 114:	85 c0                	test   %eax,%eax
 116:	7e 17                	jle    12f <gets+0x4d>
      break;
    buf[i++] = c;
 118:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 11c:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 11f:	3c 0a                	cmp    $0xa,%al
 121:	0f 94 c2             	sete   %dl
 124:	3c 0d                	cmp    $0xd,%al
 126:	0f 94 c0             	sete   %al
 129:	08 c2                	or     %al,%dl
 12b:	74 ca                	je     f7 <gets+0x15>
    buf[i++] = c;
 12d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 12f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 133:	89 f8                	mov    %edi,%eax
 135:	8d 65 f4             	lea    -0xc(%ebp),%esp
 138:	5b                   	pop    %ebx
 139:	5e                   	pop    %esi
 13a:	5f                   	pop    %edi
 13b:	5d                   	pop    %ebp
 13c:	c3                   	ret    

0000013d <stat>:

int
stat(char *n, struct stat *st)
{
 13d:	f3 0f 1e fb          	endbr32 
 141:	55                   	push   %ebp
 142:	89 e5                	mov    %esp,%ebp
 144:	56                   	push   %esi
 145:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 146:	83 ec 08             	sub    $0x8,%esp
 149:	6a 00                	push   $0x0
 14b:	ff 75 08             	pushl  0x8(%ebp)
 14e:	e8 b5 01 00 00       	call   308 <open>
  if(fd < 0)
 153:	83 c4 10             	add    $0x10,%esp
 156:	85 c0                	test   %eax,%eax
 158:	78 24                	js     17e <stat+0x41>
 15a:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 15c:	83 ec 08             	sub    $0x8,%esp
 15f:	ff 75 0c             	pushl  0xc(%ebp)
 162:	50                   	push   %eax
 163:	e8 b8 01 00 00       	call   320 <fstat>
 168:	89 c6                	mov    %eax,%esi
  close(fd);
 16a:	89 1c 24             	mov    %ebx,(%esp)
 16d:	e8 7e 01 00 00       	call   2f0 <close>
  return r;
 172:	83 c4 10             	add    $0x10,%esp
}
 175:	89 f0                	mov    %esi,%eax
 177:	8d 65 f8             	lea    -0x8(%ebp),%esp
 17a:	5b                   	pop    %ebx
 17b:	5e                   	pop    %esi
 17c:	5d                   	pop    %ebp
 17d:	c3                   	ret    
    return -1;
 17e:	be ff ff ff ff       	mov    $0xffffffff,%esi
 183:	eb f0                	jmp    175 <stat+0x38>

00000185 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 185:	f3 0f 1e fb          	endbr32 
 189:	55                   	push   %ebp
 18a:	89 e5                	mov    %esp,%ebp
 18c:	57                   	push   %edi
 18d:	56                   	push   %esi
 18e:	53                   	push   %ebx
 18f:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 192:	0f b6 02             	movzbl (%edx),%eax
 195:	3c 20                	cmp    $0x20,%al
 197:	75 05                	jne    19e <atoi+0x19>
 199:	83 c2 01             	add    $0x1,%edx
 19c:	eb f4                	jmp    192 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 19e:	3c 2d                	cmp    $0x2d,%al
 1a0:	74 1d                	je     1bf <atoi+0x3a>
 1a2:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 1a7:	3c 2b                	cmp    $0x2b,%al
 1a9:	0f 94 c1             	sete   %cl
 1ac:	3c 2d                	cmp    $0x2d,%al
 1ae:	0f 94 c0             	sete   %al
 1b1:	08 c1                	or     %al,%cl
 1b3:	74 03                	je     1b8 <atoi+0x33>
    s++;
 1b5:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 1b8:	b8 00 00 00 00       	mov    $0x0,%eax
 1bd:	eb 17                	jmp    1d6 <atoi+0x51>
 1bf:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 1c4:	eb e1                	jmp    1a7 <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 1c6:	8d 34 80             	lea    (%eax,%eax,4),%esi
 1c9:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 1cc:	83 c2 01             	add    $0x1,%edx
 1cf:	0f be c9             	movsbl %cl,%ecx
 1d2:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 1d6:	0f b6 0a             	movzbl (%edx),%ecx
 1d9:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 1dc:	80 fb 09             	cmp    $0x9,%bl
 1df:	76 e5                	jbe    1c6 <atoi+0x41>
  return sign*n;
 1e1:	0f af c7             	imul   %edi,%eax
}
 1e4:	5b                   	pop    %ebx
 1e5:	5e                   	pop    %esi
 1e6:	5f                   	pop    %edi
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret    

000001e9 <atoo>:

int
atoo(const char *s)
{
 1e9:	f3 0f 1e fb          	endbr32 
 1ed:	55                   	push   %ebp
 1ee:	89 e5                	mov    %esp,%ebp
 1f0:	57                   	push   %edi
 1f1:	56                   	push   %esi
 1f2:	53                   	push   %ebx
 1f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 1f6:	0f b6 0a             	movzbl (%edx),%ecx
 1f9:	80 f9 20             	cmp    $0x20,%cl
 1fc:	75 05                	jne    203 <atoo+0x1a>
 1fe:	83 c2 01             	add    $0x1,%edx
 201:	eb f3                	jmp    1f6 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 203:	80 f9 2d             	cmp    $0x2d,%cl
 206:	74 23                	je     22b <atoo+0x42>
 208:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 20d:	80 f9 2b             	cmp    $0x2b,%cl
 210:	0f 94 c0             	sete   %al
 213:	89 c6                	mov    %eax,%esi
 215:	80 f9 2d             	cmp    $0x2d,%cl
 218:	0f 94 c0             	sete   %al
 21b:	89 f3                	mov    %esi,%ebx
 21d:	08 c3                	or     %al,%bl
 21f:	74 03                	je     224 <atoo+0x3b>
    s++;
 221:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 224:	b8 00 00 00 00       	mov    $0x0,%eax
 229:	eb 11                	jmp    23c <atoo+0x53>
 22b:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 230:	eb db                	jmp    20d <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 232:	83 c2 01             	add    $0x1,%edx
 235:	0f be c9             	movsbl %cl,%ecx
 238:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 23c:	0f b6 0a             	movzbl (%edx),%ecx
 23f:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 242:	80 fb 07             	cmp    $0x7,%bl
 245:	76 eb                	jbe    232 <atoo+0x49>
  return sign*n;
 247:	0f af c7             	imul   %edi,%eax
}
 24a:	5b                   	pop    %ebx
 24b:	5e                   	pop    %esi
 24c:	5f                   	pop    %edi
 24d:	5d                   	pop    %ebp
 24e:	c3                   	ret    

0000024f <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 24f:	f3 0f 1e fb          	endbr32 
 253:	55                   	push   %ebp
 254:	89 e5                	mov    %esp,%ebp
 256:	53                   	push   %ebx
 257:	8b 55 08             	mov    0x8(%ebp),%edx
 25a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 25d:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 260:	eb 09                	jmp    26b <strncmp+0x1c>
      n--, p++, q++;
 262:	83 e8 01             	sub    $0x1,%eax
 265:	83 c2 01             	add    $0x1,%edx
 268:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 26b:	85 c0                	test   %eax,%eax
 26d:	74 0b                	je     27a <strncmp+0x2b>
 26f:	0f b6 1a             	movzbl (%edx),%ebx
 272:	84 db                	test   %bl,%bl
 274:	74 04                	je     27a <strncmp+0x2b>
 276:	3a 19                	cmp    (%ecx),%bl
 278:	74 e8                	je     262 <strncmp+0x13>
    if(n == 0)
 27a:	85 c0                	test   %eax,%eax
 27c:	74 0b                	je     289 <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 27e:	0f b6 02             	movzbl (%edx),%eax
 281:	0f b6 11             	movzbl (%ecx),%edx
 284:	29 d0                	sub    %edx,%eax
}
 286:	5b                   	pop    %ebx
 287:	5d                   	pop    %ebp
 288:	c3                   	ret    
      return 0;
 289:	b8 00 00 00 00       	mov    $0x0,%eax
 28e:	eb f6                	jmp    286 <strncmp+0x37>

00000290 <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	56                   	push   %esi
 298:	53                   	push   %ebx
 299:	8b 75 08             	mov    0x8(%ebp),%esi
 29c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 29f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 2a2:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2a4:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2a7:	85 c0                	test   %eax,%eax
 2a9:	7e 0f                	jle    2ba <memmove+0x2a>
    *dst++ = *src++;
 2ab:	0f b6 01             	movzbl (%ecx),%eax
 2ae:	88 02                	mov    %al,(%edx)
 2b0:	8d 49 01             	lea    0x1(%ecx),%ecx
 2b3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2b6:	89 d8                	mov    %ebx,%eax
 2b8:	eb ea                	jmp    2a4 <memmove+0x14>
  return vdst;
}
 2ba:	89 f0                	mov    %esi,%eax
 2bc:	5b                   	pop    %ebx
 2bd:	5e                   	pop    %esi
 2be:	5d                   	pop    %ebp
 2bf:	c3                   	ret    

000002c0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2c0:	b8 01 00 00 00       	mov    $0x1,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <exit>:
SYSCALL(exit)
 2c8:	b8 02 00 00 00       	mov    $0x2,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <wait>:
SYSCALL(wait)
 2d0:	b8 03 00 00 00       	mov    $0x3,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <pipe>:
SYSCALL(pipe)
 2d8:	b8 04 00 00 00       	mov    $0x4,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <read>:
SYSCALL(read)
 2e0:	b8 05 00 00 00       	mov    $0x5,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <write>:
SYSCALL(write)
 2e8:	b8 10 00 00 00       	mov    $0x10,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <close>:
SYSCALL(close)
 2f0:	b8 15 00 00 00       	mov    $0x15,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <kill>:
SYSCALL(kill)
 2f8:	b8 06 00 00 00       	mov    $0x6,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <exec>:
SYSCALL(exec)
 300:	b8 07 00 00 00       	mov    $0x7,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <open>:
SYSCALL(open)
 308:	b8 0f 00 00 00       	mov    $0xf,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <mknod>:
SYSCALL(mknod)
 310:	b8 11 00 00 00       	mov    $0x11,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <unlink>:
SYSCALL(unlink)
 318:	b8 12 00 00 00       	mov    $0x12,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <fstat>:
SYSCALL(fstat)
 320:	b8 08 00 00 00       	mov    $0x8,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <link>:
SYSCALL(link)
 328:	b8 13 00 00 00       	mov    $0x13,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <mkdir>:
SYSCALL(mkdir)
 330:	b8 14 00 00 00       	mov    $0x14,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <chdir>:
SYSCALL(chdir)
 338:	b8 09 00 00 00       	mov    $0x9,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <dup>:
SYSCALL(dup)
 340:	b8 0a 00 00 00       	mov    $0xa,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <getpid>:
SYSCALL(getpid)
 348:	b8 0b 00 00 00       	mov    $0xb,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <sbrk>:
SYSCALL(sbrk)
 350:	b8 0c 00 00 00       	mov    $0xc,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <sleep>:
SYSCALL(sleep)
 358:	b8 0d 00 00 00       	mov    $0xd,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <uptime>:
SYSCALL(uptime)
 360:	b8 0e 00 00 00       	mov    $0xe,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <halt>:
SYSCALL(halt)
 368:	b8 16 00 00 00       	mov    $0x16,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <date>:
SYSCALL(date)
 370:	b8 17 00 00 00       	mov    $0x17,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <getuid>:
SYSCALL(getuid)
 378:	b8 18 00 00 00       	mov    $0x18,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <getgid>:
SYSCALL(getgid)
 380:	b8 19 00 00 00       	mov    $0x19,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <getppid>:
SYSCALL(getppid)
 388:	b8 1a 00 00 00       	mov    $0x1a,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <setuid>:
SYSCALL(setuid)
 390:	b8 1b 00 00 00       	mov    $0x1b,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <setgid>:
SYSCALL(setgid)
 398:	b8 1c 00 00 00       	mov    $0x1c,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <getprocs>:
 3a0:	b8 1d 00 00 00       	mov    $0x1d,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3a8:	55                   	push   %ebp
 3a9:	89 e5                	mov    %esp,%ebp
 3ab:	83 ec 1c             	sub    $0x1c,%esp
 3ae:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3b1:	6a 01                	push   $0x1
 3b3:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3b6:	52                   	push   %edx
 3b7:	50                   	push   %eax
 3b8:	e8 2b ff ff ff       	call   2e8 <write>
}
 3bd:	83 c4 10             	add    $0x10,%esp
 3c0:	c9                   	leave  
 3c1:	c3                   	ret    

000003c2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3c2:	55                   	push   %ebp
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	57                   	push   %edi
 3c6:	56                   	push   %esi
 3c7:	53                   	push   %ebx
 3c8:	83 ec 2c             	sub    $0x2c,%esp
 3cb:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3ce:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3d0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3d4:	0f 95 c2             	setne  %dl
 3d7:	89 f0                	mov    %esi,%eax
 3d9:	c1 e8 1f             	shr    $0x1f,%eax
 3dc:	84 c2                	test   %al,%dl
 3de:	74 42                	je     422 <printint+0x60>
    neg = 1;
    x = -xx;
 3e0:	f7 de                	neg    %esi
    neg = 1;
 3e2:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3e9:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3ee:	89 f0                	mov    %esi,%eax
 3f0:	ba 00 00 00 00       	mov    $0x0,%edx
 3f5:	f7 f1                	div    %ecx
 3f7:	89 df                	mov    %ebx,%edi
 3f9:	83 c3 01             	add    $0x1,%ebx
 3fc:	0f b6 92 10 07 00 00 	movzbl 0x710(%edx),%edx
 403:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 407:	89 f2                	mov    %esi,%edx
 409:	89 c6                	mov    %eax,%esi
 40b:	39 d1                	cmp    %edx,%ecx
 40d:	76 df                	jbe    3ee <printint+0x2c>
  if(neg)
 40f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 413:	74 2f                	je     444 <printint+0x82>
    buf[i++] = '-';
 415:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 41a:	8d 5f 02             	lea    0x2(%edi),%ebx
 41d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 420:	eb 15                	jmp    437 <printint+0x75>
  neg = 0;
 422:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 429:	eb be                	jmp    3e9 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 42b:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 430:	89 f0                	mov    %esi,%eax
 432:	e8 71 ff ff ff       	call   3a8 <putc>
  while(--i >= 0)
 437:	83 eb 01             	sub    $0x1,%ebx
 43a:	79 ef                	jns    42b <printint+0x69>
}
 43c:	83 c4 2c             	add    $0x2c,%esp
 43f:	5b                   	pop    %ebx
 440:	5e                   	pop    %esi
 441:	5f                   	pop    %edi
 442:	5d                   	pop    %ebp
 443:	c3                   	ret    
 444:	8b 75 d0             	mov    -0x30(%ebp),%esi
 447:	eb ee                	jmp    437 <printint+0x75>

00000449 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 449:	f3 0f 1e fb          	endbr32 
 44d:	55                   	push   %ebp
 44e:	89 e5                	mov    %esp,%ebp
 450:	57                   	push   %edi
 451:	56                   	push   %esi
 452:	53                   	push   %ebx
 453:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 456:	8d 45 10             	lea    0x10(%ebp),%eax
 459:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 45c:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 461:	bb 00 00 00 00       	mov    $0x0,%ebx
 466:	eb 14                	jmp    47c <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 468:	89 fa                	mov    %edi,%edx
 46a:	8b 45 08             	mov    0x8(%ebp),%eax
 46d:	e8 36 ff ff ff       	call   3a8 <putc>
 472:	eb 05                	jmp    479 <printf+0x30>
      }
    } else if(state == '%'){
 474:	83 fe 25             	cmp    $0x25,%esi
 477:	74 25                	je     49e <printf+0x55>
  for(i = 0; fmt[i]; i++){
 479:	83 c3 01             	add    $0x1,%ebx
 47c:	8b 45 0c             	mov    0xc(%ebp),%eax
 47f:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 483:	84 c0                	test   %al,%al
 485:	0f 84 23 01 00 00    	je     5ae <printf+0x165>
    c = fmt[i] & 0xff;
 48b:	0f be f8             	movsbl %al,%edi
 48e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 491:	85 f6                	test   %esi,%esi
 493:	75 df                	jne    474 <printf+0x2b>
      if(c == '%'){
 495:	83 f8 25             	cmp    $0x25,%eax
 498:	75 ce                	jne    468 <printf+0x1f>
        state = '%';
 49a:	89 c6                	mov    %eax,%esi
 49c:	eb db                	jmp    479 <printf+0x30>
      if(c == 'd'){
 49e:	83 f8 64             	cmp    $0x64,%eax
 4a1:	74 49                	je     4ec <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4a3:	83 f8 78             	cmp    $0x78,%eax
 4a6:	0f 94 c1             	sete   %cl
 4a9:	83 f8 70             	cmp    $0x70,%eax
 4ac:	0f 94 c2             	sete   %dl
 4af:	08 d1                	or     %dl,%cl
 4b1:	75 63                	jne    516 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4b3:	83 f8 73             	cmp    $0x73,%eax
 4b6:	0f 84 84 00 00 00    	je     540 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4bc:	83 f8 63             	cmp    $0x63,%eax
 4bf:	0f 84 b7 00 00 00    	je     57c <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4c5:	83 f8 25             	cmp    $0x25,%eax
 4c8:	0f 84 cc 00 00 00    	je     59a <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 4ce:	ba 25 00 00 00       	mov    $0x25,%edx
 4d3:	8b 45 08             	mov    0x8(%ebp),%eax
 4d6:	e8 cd fe ff ff       	call   3a8 <putc>
        putc(fd, c);
 4db:	89 fa                	mov    %edi,%edx
 4dd:	8b 45 08             	mov    0x8(%ebp),%eax
 4e0:	e8 c3 fe ff ff       	call   3a8 <putc>
      }
      state = 0;
 4e5:	be 00 00 00 00       	mov    $0x0,%esi
 4ea:	eb 8d                	jmp    479 <printf+0x30>
        printint(fd, *ap, 10, 1);
 4ec:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4ef:	8b 17                	mov    (%edi),%edx
 4f1:	83 ec 0c             	sub    $0xc,%esp
 4f4:	6a 01                	push   $0x1
 4f6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4fb:	8b 45 08             	mov    0x8(%ebp),%eax
 4fe:	e8 bf fe ff ff       	call   3c2 <printint>
        ap++;
 503:	83 c7 04             	add    $0x4,%edi
 506:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 509:	83 c4 10             	add    $0x10,%esp
      state = 0;
 50c:	be 00 00 00 00       	mov    $0x0,%esi
 511:	e9 63 ff ff ff       	jmp    479 <printf+0x30>
        printint(fd, *ap, 16, 0);
 516:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 519:	8b 17                	mov    (%edi),%edx
 51b:	83 ec 0c             	sub    $0xc,%esp
 51e:	6a 00                	push   $0x0
 520:	b9 10 00 00 00       	mov    $0x10,%ecx
 525:	8b 45 08             	mov    0x8(%ebp),%eax
 528:	e8 95 fe ff ff       	call   3c2 <printint>
        ap++;
 52d:	83 c7 04             	add    $0x4,%edi
 530:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 533:	83 c4 10             	add    $0x10,%esp
      state = 0;
 536:	be 00 00 00 00       	mov    $0x0,%esi
 53b:	e9 39 ff ff ff       	jmp    479 <printf+0x30>
        s = (char*)*ap;
 540:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 543:	8b 30                	mov    (%eax),%esi
        ap++;
 545:	83 c0 04             	add    $0x4,%eax
 548:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 54b:	85 f6                	test   %esi,%esi
 54d:	75 28                	jne    577 <printf+0x12e>
          s = "(null)";
 54f:	be 08 07 00 00       	mov    $0x708,%esi
 554:	8b 7d 08             	mov    0x8(%ebp),%edi
 557:	eb 0d                	jmp    566 <printf+0x11d>
          putc(fd, *s);
 559:	0f be d2             	movsbl %dl,%edx
 55c:	89 f8                	mov    %edi,%eax
 55e:	e8 45 fe ff ff       	call   3a8 <putc>
          s++;
 563:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 566:	0f b6 16             	movzbl (%esi),%edx
 569:	84 d2                	test   %dl,%dl
 56b:	75 ec                	jne    559 <printf+0x110>
      state = 0;
 56d:	be 00 00 00 00       	mov    $0x0,%esi
 572:	e9 02 ff ff ff       	jmp    479 <printf+0x30>
 577:	8b 7d 08             	mov    0x8(%ebp),%edi
 57a:	eb ea                	jmp    566 <printf+0x11d>
        putc(fd, *ap);
 57c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 57f:	0f be 17             	movsbl (%edi),%edx
 582:	8b 45 08             	mov    0x8(%ebp),%eax
 585:	e8 1e fe ff ff       	call   3a8 <putc>
        ap++;
 58a:	83 c7 04             	add    $0x4,%edi
 58d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 590:	be 00 00 00 00       	mov    $0x0,%esi
 595:	e9 df fe ff ff       	jmp    479 <printf+0x30>
        putc(fd, c);
 59a:	89 fa                	mov    %edi,%edx
 59c:	8b 45 08             	mov    0x8(%ebp),%eax
 59f:	e8 04 fe ff ff       	call   3a8 <putc>
      state = 0;
 5a4:	be 00 00 00 00       	mov    $0x0,%esi
 5a9:	e9 cb fe ff ff       	jmp    479 <printf+0x30>
    }
  }
}
 5ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b1:	5b                   	pop    %ebx
 5b2:	5e                   	pop    %esi
 5b3:	5f                   	pop    %edi
 5b4:	5d                   	pop    %ebp
 5b5:	c3                   	ret    

000005b6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5b6:	f3 0f 1e fb          	endbr32 
 5ba:	55                   	push   %ebp
 5bb:	89 e5                	mov    %esp,%ebp
 5bd:	57                   	push   %edi
 5be:	56                   	push   %esi
 5bf:	53                   	push   %ebx
 5c0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5c3:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c6:	a1 0c 0a 00 00       	mov    0xa0c,%eax
 5cb:	eb 02                	jmp    5cf <free+0x19>
 5cd:	89 d0                	mov    %edx,%eax
 5cf:	39 c8                	cmp    %ecx,%eax
 5d1:	73 04                	jae    5d7 <free+0x21>
 5d3:	39 08                	cmp    %ecx,(%eax)
 5d5:	77 12                	ja     5e9 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d7:	8b 10                	mov    (%eax),%edx
 5d9:	39 c2                	cmp    %eax,%edx
 5db:	77 f0                	ja     5cd <free+0x17>
 5dd:	39 c8                	cmp    %ecx,%eax
 5df:	72 08                	jb     5e9 <free+0x33>
 5e1:	39 ca                	cmp    %ecx,%edx
 5e3:	77 04                	ja     5e9 <free+0x33>
 5e5:	89 d0                	mov    %edx,%eax
 5e7:	eb e6                	jmp    5cf <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5e9:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5ec:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ef:	8b 10                	mov    (%eax),%edx
 5f1:	39 d7                	cmp    %edx,%edi
 5f3:	74 19                	je     60e <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5f5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5f8:	8b 50 04             	mov    0x4(%eax),%edx
 5fb:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5fe:	39 ce                	cmp    %ecx,%esi
 600:	74 1b                	je     61d <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 602:	89 08                	mov    %ecx,(%eax)
  freep = p;
 604:	a3 0c 0a 00 00       	mov    %eax,0xa0c
}
 609:	5b                   	pop    %ebx
 60a:	5e                   	pop    %esi
 60b:	5f                   	pop    %edi
 60c:	5d                   	pop    %ebp
 60d:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 60e:	03 72 04             	add    0x4(%edx),%esi
 611:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 614:	8b 10                	mov    (%eax),%edx
 616:	8b 12                	mov    (%edx),%edx
 618:	89 53 f8             	mov    %edx,-0x8(%ebx)
 61b:	eb db                	jmp    5f8 <free+0x42>
    p->s.size += bp->s.size;
 61d:	03 53 fc             	add    -0x4(%ebx),%edx
 620:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 623:	8b 53 f8             	mov    -0x8(%ebx),%edx
 626:	89 10                	mov    %edx,(%eax)
 628:	eb da                	jmp    604 <free+0x4e>

0000062a <morecore>:

static Header*
morecore(uint nu)
{
 62a:	55                   	push   %ebp
 62b:	89 e5                	mov    %esp,%ebp
 62d:	53                   	push   %ebx
 62e:	83 ec 04             	sub    $0x4,%esp
 631:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 633:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 638:	77 05                	ja     63f <morecore+0x15>
    nu = 4096;
 63a:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 63f:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 646:	83 ec 0c             	sub    $0xc,%esp
 649:	50                   	push   %eax
 64a:	e8 01 fd ff ff       	call   350 <sbrk>
  if(p == (char*)-1)
 64f:	83 c4 10             	add    $0x10,%esp
 652:	83 f8 ff             	cmp    $0xffffffff,%eax
 655:	74 1c                	je     673 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 657:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 65a:	83 c0 08             	add    $0x8,%eax
 65d:	83 ec 0c             	sub    $0xc,%esp
 660:	50                   	push   %eax
 661:	e8 50 ff ff ff       	call   5b6 <free>
  return freep;
 666:	a1 0c 0a 00 00       	mov    0xa0c,%eax
 66b:	83 c4 10             	add    $0x10,%esp
}
 66e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 671:	c9                   	leave  
 672:	c3                   	ret    
    return 0;
 673:	b8 00 00 00 00       	mov    $0x0,%eax
 678:	eb f4                	jmp    66e <morecore+0x44>

0000067a <malloc>:

void*
malloc(uint nbytes)
{
 67a:	f3 0f 1e fb          	endbr32 
 67e:	55                   	push   %ebp
 67f:	89 e5                	mov    %esp,%ebp
 681:	53                   	push   %ebx
 682:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 685:	8b 45 08             	mov    0x8(%ebp),%eax
 688:	8d 58 07             	lea    0x7(%eax),%ebx
 68b:	c1 eb 03             	shr    $0x3,%ebx
 68e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 691:	8b 0d 0c 0a 00 00    	mov    0xa0c,%ecx
 697:	85 c9                	test   %ecx,%ecx
 699:	74 04                	je     69f <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 69b:	8b 01                	mov    (%ecx),%eax
 69d:	eb 4b                	jmp    6ea <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 69f:	c7 05 0c 0a 00 00 10 	movl   $0xa10,0xa0c
 6a6:	0a 00 00 
 6a9:	c7 05 10 0a 00 00 10 	movl   $0xa10,0xa10
 6b0:	0a 00 00 
    base.s.size = 0;
 6b3:	c7 05 14 0a 00 00 00 	movl   $0x0,0xa14
 6ba:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6bd:	b9 10 0a 00 00       	mov    $0xa10,%ecx
 6c2:	eb d7                	jmp    69b <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6c4:	74 1a                	je     6e0 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6c6:	29 da                	sub    %ebx,%edx
 6c8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6cb:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6ce:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6d1:	89 0d 0c 0a 00 00    	mov    %ecx,0xa0c
      return (void*)(p + 1);
 6d7:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6da:	83 c4 04             	add    $0x4,%esp
 6dd:	5b                   	pop    %ebx
 6de:	5d                   	pop    %ebp
 6df:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6e0:	8b 10                	mov    (%eax),%edx
 6e2:	89 11                	mov    %edx,(%ecx)
 6e4:	eb eb                	jmp    6d1 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e6:	89 c1                	mov    %eax,%ecx
 6e8:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6ea:	8b 50 04             	mov    0x4(%eax),%edx
 6ed:	39 da                	cmp    %ebx,%edx
 6ef:	73 d3                	jae    6c4 <malloc+0x4a>
    if(p == freep)
 6f1:	39 05 0c 0a 00 00    	cmp    %eax,0xa0c
 6f7:	75 ed                	jne    6e6 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 6f9:	89 d8                	mov    %ebx,%eax
 6fb:	e8 2a ff ff ff       	call   62a <morecore>
 700:	85 c0                	test   %eax,%eax
 702:	75 e2                	jne    6e6 <malloc+0x6c>
 704:	eb d4                	jmp    6da <malloc+0x60>
