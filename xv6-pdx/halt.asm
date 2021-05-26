
_halt:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"
#include "pdx.h"

int
main(void) {
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	83 e4 f0             	and    $0xfffffff0,%esp
  halt();
   a:	e8 3b 03 00 00       	call   34a <halt>
  exit();
   f:	e8 96 02 00 00       	call   2aa <exit>

00000014 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  14:	f3 0f 1e fb          	endbr32 
  18:	55                   	push   %ebp
  19:	89 e5                	mov    %esp,%ebp
  1b:	56                   	push   %esi
  1c:	53                   	push   %ebx
  1d:	8b 75 08             	mov    0x8(%ebp),%esi
  20:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  23:	89 f0                	mov    %esi,%eax
  25:	89 d1                	mov    %edx,%ecx
  27:	83 c2 01             	add    $0x1,%edx
  2a:	89 c3                	mov    %eax,%ebx
  2c:	83 c0 01             	add    $0x1,%eax
  2f:	0f b6 09             	movzbl (%ecx),%ecx
  32:	88 0b                	mov    %cl,(%ebx)
  34:	84 c9                	test   %cl,%cl
  36:	75 ed                	jne    25 <strcpy+0x11>
    ;
  return os;
}
  38:	89 f0                	mov    %esi,%eax
  3a:	5b                   	pop    %ebx
  3b:	5e                   	pop    %esi
  3c:	5d                   	pop    %ebp
  3d:	c3                   	ret    

0000003e <strcmp>:

int
strcmp(const char *p, const char *q)
{
  3e:	f3 0f 1e fb          	endbr32 
  42:	55                   	push   %ebp
  43:	89 e5                	mov    %esp,%ebp
  45:	8b 4d 08             	mov    0x8(%ebp),%ecx
  48:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  4b:	0f b6 01             	movzbl (%ecx),%eax
  4e:	84 c0                	test   %al,%al
  50:	74 0c                	je     5e <strcmp+0x20>
  52:	3a 02                	cmp    (%edx),%al
  54:	75 08                	jne    5e <strcmp+0x20>
    p++, q++;
  56:	83 c1 01             	add    $0x1,%ecx
  59:	83 c2 01             	add    $0x1,%edx
  5c:	eb ed                	jmp    4b <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
  5e:	0f b6 c0             	movzbl %al,%eax
  61:	0f b6 12             	movzbl (%edx),%edx
  64:	29 d0                	sub    %edx,%eax
}
  66:	5d                   	pop    %ebp
  67:	c3                   	ret    

00000068 <strlen>:

uint
strlen(char *s)
{
  68:	f3 0f 1e fb          	endbr32 
  6c:	55                   	push   %ebp
  6d:	89 e5                	mov    %esp,%ebp
  6f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  72:	b8 00 00 00 00       	mov    $0x0,%eax
  77:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  7b:	74 05                	je     82 <strlen+0x1a>
  7d:	83 c0 01             	add    $0x1,%eax
  80:	eb f5                	jmp    77 <strlen+0xf>
    ;
  return n;
}
  82:	5d                   	pop    %ebp
  83:	c3                   	ret    

00000084 <memset>:

void*
memset(void *dst, int c, uint n)
{
  84:	f3 0f 1e fb          	endbr32 
  88:	55                   	push   %ebp
  89:	89 e5                	mov    %esp,%ebp
  8b:	57                   	push   %edi
  8c:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  8f:	89 d7                	mov    %edx,%edi
  91:	8b 4d 10             	mov    0x10(%ebp),%ecx
  94:	8b 45 0c             	mov    0xc(%ebp),%eax
  97:	fc                   	cld    
  98:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  9a:	89 d0                	mov    %edx,%eax
  9c:	5f                   	pop    %edi
  9d:	5d                   	pop    %ebp
  9e:	c3                   	ret    

0000009f <strchr>:

char*
strchr(const char *s, char c)
{
  9f:	f3 0f 1e fb          	endbr32 
  a3:	55                   	push   %ebp
  a4:	89 e5                	mov    %esp,%ebp
  a6:	8b 45 08             	mov    0x8(%ebp),%eax
  a9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  ad:	0f b6 10             	movzbl (%eax),%edx
  b0:	84 d2                	test   %dl,%dl
  b2:	74 09                	je     bd <strchr+0x1e>
    if(*s == c)
  b4:	38 ca                	cmp    %cl,%dl
  b6:	74 0a                	je     c2 <strchr+0x23>
  for(; *s; s++)
  b8:	83 c0 01             	add    $0x1,%eax
  bb:	eb f0                	jmp    ad <strchr+0xe>
      return (char*)s;
  return 0;
  bd:	b8 00 00 00 00       	mov    $0x0,%eax
}
  c2:	5d                   	pop    %ebp
  c3:	c3                   	ret    

000000c4 <gets>:

char*
gets(char *buf, int max)
{
  c4:	f3 0f 1e fb          	endbr32 
  c8:	55                   	push   %ebp
  c9:	89 e5                	mov    %esp,%ebp
  cb:	57                   	push   %edi
  cc:	56                   	push   %esi
  cd:	53                   	push   %ebx
  ce:	83 ec 1c             	sub    $0x1c,%esp
  d1:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
  d4:	bb 00 00 00 00       	mov    $0x0,%ebx
  d9:	89 de                	mov    %ebx,%esi
  db:	83 c3 01             	add    $0x1,%ebx
  de:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
  e1:	7d 2e                	jge    111 <gets+0x4d>
    cc = read(0, &c, 1);
  e3:	83 ec 04             	sub    $0x4,%esp
  e6:	6a 01                	push   $0x1
  e8:	8d 45 e7             	lea    -0x19(%ebp),%eax
  eb:	50                   	push   %eax
  ec:	6a 00                	push   $0x0
  ee:	e8 cf 01 00 00       	call   2c2 <read>
    if(cc < 1)
  f3:	83 c4 10             	add    $0x10,%esp
  f6:	85 c0                	test   %eax,%eax
  f8:	7e 17                	jle    111 <gets+0x4d>
      break;
    buf[i++] = c;
  fa:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  fe:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 101:	3c 0a                	cmp    $0xa,%al
 103:	0f 94 c2             	sete   %dl
 106:	3c 0d                	cmp    $0xd,%al
 108:	0f 94 c0             	sete   %al
 10b:	08 c2                	or     %al,%dl
 10d:	74 ca                	je     d9 <gets+0x15>
    buf[i++] = c;
 10f:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 111:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 115:	89 f8                	mov    %edi,%eax
 117:	8d 65 f4             	lea    -0xc(%ebp),%esp
 11a:	5b                   	pop    %ebx
 11b:	5e                   	pop    %esi
 11c:	5f                   	pop    %edi
 11d:	5d                   	pop    %ebp
 11e:	c3                   	ret    

0000011f <stat>:

int
stat(char *n, struct stat *st)
{
 11f:	f3 0f 1e fb          	endbr32 
 123:	55                   	push   %ebp
 124:	89 e5                	mov    %esp,%ebp
 126:	56                   	push   %esi
 127:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 128:	83 ec 08             	sub    $0x8,%esp
 12b:	6a 00                	push   $0x0
 12d:	ff 75 08             	pushl  0x8(%ebp)
 130:	e8 b5 01 00 00       	call   2ea <open>
  if(fd < 0)
 135:	83 c4 10             	add    $0x10,%esp
 138:	85 c0                	test   %eax,%eax
 13a:	78 24                	js     160 <stat+0x41>
 13c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 13e:	83 ec 08             	sub    $0x8,%esp
 141:	ff 75 0c             	pushl  0xc(%ebp)
 144:	50                   	push   %eax
 145:	e8 b8 01 00 00       	call   302 <fstat>
 14a:	89 c6                	mov    %eax,%esi
  close(fd);
 14c:	89 1c 24             	mov    %ebx,(%esp)
 14f:	e8 7e 01 00 00       	call   2d2 <close>
  return r;
 154:	83 c4 10             	add    $0x10,%esp
}
 157:	89 f0                	mov    %esi,%eax
 159:	8d 65 f8             	lea    -0x8(%ebp),%esp
 15c:	5b                   	pop    %ebx
 15d:	5e                   	pop    %esi
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    
    return -1;
 160:	be ff ff ff ff       	mov    $0xffffffff,%esi
 165:	eb f0                	jmp    157 <stat+0x38>

00000167 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 167:	f3 0f 1e fb          	endbr32 
 16b:	55                   	push   %ebp
 16c:	89 e5                	mov    %esp,%ebp
 16e:	57                   	push   %edi
 16f:	56                   	push   %esi
 170:	53                   	push   %ebx
 171:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 174:	0f b6 02             	movzbl (%edx),%eax
 177:	3c 20                	cmp    $0x20,%al
 179:	75 05                	jne    180 <atoi+0x19>
 17b:	83 c2 01             	add    $0x1,%edx
 17e:	eb f4                	jmp    174 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 180:	3c 2d                	cmp    $0x2d,%al
 182:	74 1d                	je     1a1 <atoi+0x3a>
 184:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 189:	3c 2b                	cmp    $0x2b,%al
 18b:	0f 94 c1             	sete   %cl
 18e:	3c 2d                	cmp    $0x2d,%al
 190:	0f 94 c0             	sete   %al
 193:	08 c1                	or     %al,%cl
 195:	74 03                	je     19a <atoi+0x33>
    s++;
 197:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 19a:	b8 00 00 00 00       	mov    $0x0,%eax
 19f:	eb 17                	jmp    1b8 <atoi+0x51>
 1a1:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 1a6:	eb e1                	jmp    189 <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 1a8:	8d 34 80             	lea    (%eax,%eax,4),%esi
 1ab:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 1ae:	83 c2 01             	add    $0x1,%edx
 1b1:	0f be c9             	movsbl %cl,%ecx
 1b4:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 1b8:	0f b6 0a             	movzbl (%edx),%ecx
 1bb:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 1be:	80 fb 09             	cmp    $0x9,%bl
 1c1:	76 e5                	jbe    1a8 <atoi+0x41>
  return sign*n;
 1c3:	0f af c7             	imul   %edi,%eax
}
 1c6:	5b                   	pop    %ebx
 1c7:	5e                   	pop    %esi
 1c8:	5f                   	pop    %edi
 1c9:	5d                   	pop    %ebp
 1ca:	c3                   	ret    

000001cb <atoo>:

int
atoo(const char *s)
{
 1cb:	f3 0f 1e fb          	endbr32 
 1cf:	55                   	push   %ebp
 1d0:	89 e5                	mov    %esp,%ebp
 1d2:	57                   	push   %edi
 1d3:	56                   	push   %esi
 1d4:	53                   	push   %ebx
 1d5:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 1d8:	0f b6 0a             	movzbl (%edx),%ecx
 1db:	80 f9 20             	cmp    $0x20,%cl
 1de:	75 05                	jne    1e5 <atoo+0x1a>
 1e0:	83 c2 01             	add    $0x1,%edx
 1e3:	eb f3                	jmp    1d8 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 1e5:	80 f9 2d             	cmp    $0x2d,%cl
 1e8:	74 23                	je     20d <atoo+0x42>
 1ea:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 1ef:	80 f9 2b             	cmp    $0x2b,%cl
 1f2:	0f 94 c0             	sete   %al
 1f5:	89 c6                	mov    %eax,%esi
 1f7:	80 f9 2d             	cmp    $0x2d,%cl
 1fa:	0f 94 c0             	sete   %al
 1fd:	89 f3                	mov    %esi,%ebx
 1ff:	08 c3                	or     %al,%bl
 201:	74 03                	je     206 <atoo+0x3b>
    s++;
 203:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 206:	b8 00 00 00 00       	mov    $0x0,%eax
 20b:	eb 11                	jmp    21e <atoo+0x53>
 20d:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 212:	eb db                	jmp    1ef <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 214:	83 c2 01             	add    $0x1,%edx
 217:	0f be c9             	movsbl %cl,%ecx
 21a:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 21e:	0f b6 0a             	movzbl (%edx),%ecx
 221:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 224:	80 fb 07             	cmp    $0x7,%bl
 227:	76 eb                	jbe    214 <atoo+0x49>
  return sign*n;
 229:	0f af c7             	imul   %edi,%eax
}
 22c:	5b                   	pop    %ebx
 22d:	5e                   	pop    %esi
 22e:	5f                   	pop    %edi
 22f:	5d                   	pop    %ebp
 230:	c3                   	ret    

00000231 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 231:	f3 0f 1e fb          	endbr32 
 235:	55                   	push   %ebp
 236:	89 e5                	mov    %esp,%ebp
 238:	53                   	push   %ebx
 239:	8b 55 08             	mov    0x8(%ebp),%edx
 23c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 23f:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 242:	eb 09                	jmp    24d <strncmp+0x1c>
      n--, p++, q++;
 244:	83 e8 01             	sub    $0x1,%eax
 247:	83 c2 01             	add    $0x1,%edx
 24a:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 24d:	85 c0                	test   %eax,%eax
 24f:	74 0b                	je     25c <strncmp+0x2b>
 251:	0f b6 1a             	movzbl (%edx),%ebx
 254:	84 db                	test   %bl,%bl
 256:	74 04                	je     25c <strncmp+0x2b>
 258:	3a 19                	cmp    (%ecx),%bl
 25a:	74 e8                	je     244 <strncmp+0x13>
    if(n == 0)
 25c:	85 c0                	test   %eax,%eax
 25e:	74 0b                	je     26b <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 260:	0f b6 02             	movzbl (%edx),%eax
 263:	0f b6 11             	movzbl (%ecx),%edx
 266:	29 d0                	sub    %edx,%eax
}
 268:	5b                   	pop    %ebx
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret    
      return 0;
 26b:	b8 00 00 00 00       	mov    $0x0,%eax
 270:	eb f6                	jmp    268 <strncmp+0x37>

00000272 <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 272:	f3 0f 1e fb          	endbr32 
 276:	55                   	push   %ebp
 277:	89 e5                	mov    %esp,%ebp
 279:	56                   	push   %esi
 27a:	53                   	push   %ebx
 27b:	8b 75 08             	mov    0x8(%ebp),%esi
 27e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 281:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 284:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 286:	8d 58 ff             	lea    -0x1(%eax),%ebx
 289:	85 c0                	test   %eax,%eax
 28b:	7e 0f                	jle    29c <memmove+0x2a>
    *dst++ = *src++;
 28d:	0f b6 01             	movzbl (%ecx),%eax
 290:	88 02                	mov    %al,(%edx)
 292:	8d 49 01             	lea    0x1(%ecx),%ecx
 295:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 298:	89 d8                	mov    %ebx,%eax
 29a:	eb ea                	jmp    286 <memmove+0x14>
  return vdst;
}
 29c:	89 f0                	mov    %esi,%eax
 29e:	5b                   	pop    %ebx
 29f:	5e                   	pop    %esi
 2a0:	5d                   	pop    %ebp
 2a1:	c3                   	ret    

000002a2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2a2:	b8 01 00 00 00       	mov    $0x1,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <exit>:
SYSCALL(exit)
 2aa:	b8 02 00 00 00       	mov    $0x2,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <wait>:
SYSCALL(wait)
 2b2:	b8 03 00 00 00       	mov    $0x3,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <pipe>:
SYSCALL(pipe)
 2ba:	b8 04 00 00 00       	mov    $0x4,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <read>:
SYSCALL(read)
 2c2:	b8 05 00 00 00       	mov    $0x5,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <write>:
SYSCALL(write)
 2ca:	b8 10 00 00 00       	mov    $0x10,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <close>:
SYSCALL(close)
 2d2:	b8 15 00 00 00       	mov    $0x15,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <kill>:
SYSCALL(kill)
 2da:	b8 06 00 00 00       	mov    $0x6,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <exec>:
SYSCALL(exec)
 2e2:	b8 07 00 00 00       	mov    $0x7,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <open>:
SYSCALL(open)
 2ea:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <mknod>:
SYSCALL(mknod)
 2f2:	b8 11 00 00 00       	mov    $0x11,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <unlink>:
SYSCALL(unlink)
 2fa:	b8 12 00 00 00       	mov    $0x12,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <fstat>:
SYSCALL(fstat)
 302:	b8 08 00 00 00       	mov    $0x8,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <link>:
SYSCALL(link)
 30a:	b8 13 00 00 00       	mov    $0x13,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <mkdir>:
SYSCALL(mkdir)
 312:	b8 14 00 00 00       	mov    $0x14,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <chdir>:
SYSCALL(chdir)
 31a:	b8 09 00 00 00       	mov    $0x9,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <dup>:
SYSCALL(dup)
 322:	b8 0a 00 00 00       	mov    $0xa,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <getpid>:
SYSCALL(getpid)
 32a:	b8 0b 00 00 00       	mov    $0xb,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <sbrk>:
SYSCALL(sbrk)
 332:	b8 0c 00 00 00       	mov    $0xc,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <sleep>:
SYSCALL(sleep)
 33a:	b8 0d 00 00 00       	mov    $0xd,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <uptime>:
SYSCALL(uptime)
 342:	b8 0e 00 00 00       	mov    $0xe,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <halt>:
SYSCALL(halt)
 34a:	b8 16 00 00 00       	mov    $0x16,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <date>:
SYSCALL(date)
 352:	b8 17 00 00 00       	mov    $0x17,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <getuid>:
SYSCALL(getuid)
 35a:	b8 18 00 00 00       	mov    $0x18,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <getgid>:
SYSCALL(getgid)
 362:	b8 19 00 00 00       	mov    $0x19,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <getppid>:
SYSCALL(getppid)
 36a:	b8 1a 00 00 00       	mov    $0x1a,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <setuid>:
SYSCALL(setuid)
 372:	b8 1b 00 00 00       	mov    $0x1b,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <setgid>:
SYSCALL(setgid)
 37a:	b8 1c 00 00 00       	mov    $0x1c,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <getprocs>:
 382:	b8 1d 00 00 00       	mov    $0x1d,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 38a:	55                   	push   %ebp
 38b:	89 e5                	mov    %esp,%ebp
 38d:	83 ec 1c             	sub    $0x1c,%esp
 390:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 393:	6a 01                	push   $0x1
 395:	8d 55 f4             	lea    -0xc(%ebp),%edx
 398:	52                   	push   %edx
 399:	50                   	push   %eax
 39a:	e8 2b ff ff ff       	call   2ca <write>
}
 39f:	83 c4 10             	add    $0x10,%esp
 3a2:	c9                   	leave  
 3a3:	c3                   	ret    

000003a4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	57                   	push   %edi
 3a8:	56                   	push   %esi
 3a9:	53                   	push   %ebx
 3aa:	83 ec 2c             	sub    $0x2c,%esp
 3ad:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3b0:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3b2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3b6:	0f 95 c2             	setne  %dl
 3b9:	89 f0                	mov    %esi,%eax
 3bb:	c1 e8 1f             	shr    $0x1f,%eax
 3be:	84 c2                	test   %al,%dl
 3c0:	74 42                	je     404 <printint+0x60>
    neg = 1;
    x = -xx;
 3c2:	f7 de                	neg    %esi
    neg = 1;
 3c4:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3cb:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3d0:	89 f0                	mov    %esi,%eax
 3d2:	ba 00 00 00 00       	mov    $0x0,%edx
 3d7:	f7 f1                	div    %ecx
 3d9:	89 df                	mov    %ebx,%edi
 3db:	83 c3 01             	add    $0x1,%ebx
 3de:	0f b6 92 f0 06 00 00 	movzbl 0x6f0(%edx),%edx
 3e5:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3e9:	89 f2                	mov    %esi,%edx
 3eb:	89 c6                	mov    %eax,%esi
 3ed:	39 d1                	cmp    %edx,%ecx
 3ef:	76 df                	jbe    3d0 <printint+0x2c>
  if(neg)
 3f1:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3f5:	74 2f                	je     426 <printint+0x82>
    buf[i++] = '-';
 3f7:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3fc:	8d 5f 02             	lea    0x2(%edi),%ebx
 3ff:	8b 75 d0             	mov    -0x30(%ebp),%esi
 402:	eb 15                	jmp    419 <printint+0x75>
  neg = 0;
 404:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 40b:	eb be                	jmp    3cb <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 40d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 412:	89 f0                	mov    %esi,%eax
 414:	e8 71 ff ff ff       	call   38a <putc>
  while(--i >= 0)
 419:	83 eb 01             	sub    $0x1,%ebx
 41c:	79 ef                	jns    40d <printint+0x69>
}
 41e:	83 c4 2c             	add    $0x2c,%esp
 421:	5b                   	pop    %ebx
 422:	5e                   	pop    %esi
 423:	5f                   	pop    %edi
 424:	5d                   	pop    %ebp
 425:	c3                   	ret    
 426:	8b 75 d0             	mov    -0x30(%ebp),%esi
 429:	eb ee                	jmp    419 <printint+0x75>

0000042b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 42b:	f3 0f 1e fb          	endbr32 
 42f:	55                   	push   %ebp
 430:	89 e5                	mov    %esp,%ebp
 432:	57                   	push   %edi
 433:	56                   	push   %esi
 434:	53                   	push   %ebx
 435:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 438:	8d 45 10             	lea    0x10(%ebp),%eax
 43b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 43e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 443:	bb 00 00 00 00       	mov    $0x0,%ebx
 448:	eb 14                	jmp    45e <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 44a:	89 fa                	mov    %edi,%edx
 44c:	8b 45 08             	mov    0x8(%ebp),%eax
 44f:	e8 36 ff ff ff       	call   38a <putc>
 454:	eb 05                	jmp    45b <printf+0x30>
      }
    } else if(state == '%'){
 456:	83 fe 25             	cmp    $0x25,%esi
 459:	74 25                	je     480 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 45b:	83 c3 01             	add    $0x1,%ebx
 45e:	8b 45 0c             	mov    0xc(%ebp),%eax
 461:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 465:	84 c0                	test   %al,%al
 467:	0f 84 23 01 00 00    	je     590 <printf+0x165>
    c = fmt[i] & 0xff;
 46d:	0f be f8             	movsbl %al,%edi
 470:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 473:	85 f6                	test   %esi,%esi
 475:	75 df                	jne    456 <printf+0x2b>
      if(c == '%'){
 477:	83 f8 25             	cmp    $0x25,%eax
 47a:	75 ce                	jne    44a <printf+0x1f>
        state = '%';
 47c:	89 c6                	mov    %eax,%esi
 47e:	eb db                	jmp    45b <printf+0x30>
      if(c == 'd'){
 480:	83 f8 64             	cmp    $0x64,%eax
 483:	74 49                	je     4ce <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 485:	83 f8 78             	cmp    $0x78,%eax
 488:	0f 94 c1             	sete   %cl
 48b:	83 f8 70             	cmp    $0x70,%eax
 48e:	0f 94 c2             	sete   %dl
 491:	08 d1                	or     %dl,%cl
 493:	75 63                	jne    4f8 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 495:	83 f8 73             	cmp    $0x73,%eax
 498:	0f 84 84 00 00 00    	je     522 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 49e:	83 f8 63             	cmp    $0x63,%eax
 4a1:	0f 84 b7 00 00 00    	je     55e <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4a7:	83 f8 25             	cmp    $0x25,%eax
 4aa:	0f 84 cc 00 00 00    	je     57c <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 4b0:	ba 25 00 00 00       	mov    $0x25,%edx
 4b5:	8b 45 08             	mov    0x8(%ebp),%eax
 4b8:	e8 cd fe ff ff       	call   38a <putc>
        putc(fd, c);
 4bd:	89 fa                	mov    %edi,%edx
 4bf:	8b 45 08             	mov    0x8(%ebp),%eax
 4c2:	e8 c3 fe ff ff       	call   38a <putc>
      }
      state = 0;
 4c7:	be 00 00 00 00       	mov    $0x0,%esi
 4cc:	eb 8d                	jmp    45b <printf+0x30>
        printint(fd, *ap, 10, 1);
 4ce:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4d1:	8b 17                	mov    (%edi),%edx
 4d3:	83 ec 0c             	sub    $0xc,%esp
 4d6:	6a 01                	push   $0x1
 4d8:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4dd:	8b 45 08             	mov    0x8(%ebp),%eax
 4e0:	e8 bf fe ff ff       	call   3a4 <printint>
        ap++;
 4e5:	83 c7 04             	add    $0x4,%edi
 4e8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4eb:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4ee:	be 00 00 00 00       	mov    $0x0,%esi
 4f3:	e9 63 ff ff ff       	jmp    45b <printf+0x30>
        printint(fd, *ap, 16, 0);
 4f8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4fb:	8b 17                	mov    (%edi),%edx
 4fd:	83 ec 0c             	sub    $0xc,%esp
 500:	6a 00                	push   $0x0
 502:	b9 10 00 00 00       	mov    $0x10,%ecx
 507:	8b 45 08             	mov    0x8(%ebp),%eax
 50a:	e8 95 fe ff ff       	call   3a4 <printint>
        ap++;
 50f:	83 c7 04             	add    $0x4,%edi
 512:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 515:	83 c4 10             	add    $0x10,%esp
      state = 0;
 518:	be 00 00 00 00       	mov    $0x0,%esi
 51d:	e9 39 ff ff ff       	jmp    45b <printf+0x30>
        s = (char*)*ap;
 522:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 525:	8b 30                	mov    (%eax),%esi
        ap++;
 527:	83 c0 04             	add    $0x4,%eax
 52a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 52d:	85 f6                	test   %esi,%esi
 52f:	75 28                	jne    559 <printf+0x12e>
          s = "(null)";
 531:	be e8 06 00 00       	mov    $0x6e8,%esi
 536:	8b 7d 08             	mov    0x8(%ebp),%edi
 539:	eb 0d                	jmp    548 <printf+0x11d>
          putc(fd, *s);
 53b:	0f be d2             	movsbl %dl,%edx
 53e:	89 f8                	mov    %edi,%eax
 540:	e8 45 fe ff ff       	call   38a <putc>
          s++;
 545:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 548:	0f b6 16             	movzbl (%esi),%edx
 54b:	84 d2                	test   %dl,%dl
 54d:	75 ec                	jne    53b <printf+0x110>
      state = 0;
 54f:	be 00 00 00 00       	mov    $0x0,%esi
 554:	e9 02 ff ff ff       	jmp    45b <printf+0x30>
 559:	8b 7d 08             	mov    0x8(%ebp),%edi
 55c:	eb ea                	jmp    548 <printf+0x11d>
        putc(fd, *ap);
 55e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 561:	0f be 17             	movsbl (%edi),%edx
 564:	8b 45 08             	mov    0x8(%ebp),%eax
 567:	e8 1e fe ff ff       	call   38a <putc>
        ap++;
 56c:	83 c7 04             	add    $0x4,%edi
 56f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 572:	be 00 00 00 00       	mov    $0x0,%esi
 577:	e9 df fe ff ff       	jmp    45b <printf+0x30>
        putc(fd, c);
 57c:	89 fa                	mov    %edi,%edx
 57e:	8b 45 08             	mov    0x8(%ebp),%eax
 581:	e8 04 fe ff ff       	call   38a <putc>
      state = 0;
 586:	be 00 00 00 00       	mov    $0x0,%esi
 58b:	e9 cb fe ff ff       	jmp    45b <printf+0x30>
    }
  }
}
 590:	8d 65 f4             	lea    -0xc(%ebp),%esp
 593:	5b                   	pop    %ebx
 594:	5e                   	pop    %esi
 595:	5f                   	pop    %edi
 596:	5d                   	pop    %ebp
 597:	c3                   	ret    

00000598 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 598:	f3 0f 1e fb          	endbr32 
 59c:	55                   	push   %ebp
 59d:	89 e5                	mov    %esp,%ebp
 59f:	57                   	push   %edi
 5a0:	56                   	push   %esi
 5a1:	53                   	push   %ebx
 5a2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5a5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5a8:	a1 e4 09 00 00       	mov    0x9e4,%eax
 5ad:	eb 02                	jmp    5b1 <free+0x19>
 5af:	89 d0                	mov    %edx,%eax
 5b1:	39 c8                	cmp    %ecx,%eax
 5b3:	73 04                	jae    5b9 <free+0x21>
 5b5:	39 08                	cmp    %ecx,(%eax)
 5b7:	77 12                	ja     5cb <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5b9:	8b 10                	mov    (%eax),%edx
 5bb:	39 c2                	cmp    %eax,%edx
 5bd:	77 f0                	ja     5af <free+0x17>
 5bf:	39 c8                	cmp    %ecx,%eax
 5c1:	72 08                	jb     5cb <free+0x33>
 5c3:	39 ca                	cmp    %ecx,%edx
 5c5:	77 04                	ja     5cb <free+0x33>
 5c7:	89 d0                	mov    %edx,%eax
 5c9:	eb e6                	jmp    5b1 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5cb:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5ce:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5d1:	8b 10                	mov    (%eax),%edx
 5d3:	39 d7                	cmp    %edx,%edi
 5d5:	74 19                	je     5f0 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5d7:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5da:	8b 50 04             	mov    0x4(%eax),%edx
 5dd:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5e0:	39 ce                	cmp    %ecx,%esi
 5e2:	74 1b                	je     5ff <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5e4:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5e6:	a3 e4 09 00 00       	mov    %eax,0x9e4
}
 5eb:	5b                   	pop    %ebx
 5ec:	5e                   	pop    %esi
 5ed:	5f                   	pop    %edi
 5ee:	5d                   	pop    %ebp
 5ef:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5f0:	03 72 04             	add    0x4(%edx),%esi
 5f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5f6:	8b 10                	mov    (%eax),%edx
 5f8:	8b 12                	mov    (%edx),%edx
 5fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5fd:	eb db                	jmp    5da <free+0x42>
    p->s.size += bp->s.size;
 5ff:	03 53 fc             	add    -0x4(%ebx),%edx
 602:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 605:	8b 53 f8             	mov    -0x8(%ebx),%edx
 608:	89 10                	mov    %edx,(%eax)
 60a:	eb da                	jmp    5e6 <free+0x4e>

0000060c <morecore>:

static Header*
morecore(uint nu)
{
 60c:	55                   	push   %ebp
 60d:	89 e5                	mov    %esp,%ebp
 60f:	53                   	push   %ebx
 610:	83 ec 04             	sub    $0x4,%esp
 613:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 615:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 61a:	77 05                	ja     621 <morecore+0x15>
    nu = 4096;
 61c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 621:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 628:	83 ec 0c             	sub    $0xc,%esp
 62b:	50                   	push   %eax
 62c:	e8 01 fd ff ff       	call   332 <sbrk>
  if(p == (char*)-1)
 631:	83 c4 10             	add    $0x10,%esp
 634:	83 f8 ff             	cmp    $0xffffffff,%eax
 637:	74 1c                	je     655 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 639:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 63c:	83 c0 08             	add    $0x8,%eax
 63f:	83 ec 0c             	sub    $0xc,%esp
 642:	50                   	push   %eax
 643:	e8 50 ff ff ff       	call   598 <free>
  return freep;
 648:	a1 e4 09 00 00       	mov    0x9e4,%eax
 64d:	83 c4 10             	add    $0x10,%esp
}
 650:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 653:	c9                   	leave  
 654:	c3                   	ret    
    return 0;
 655:	b8 00 00 00 00       	mov    $0x0,%eax
 65a:	eb f4                	jmp    650 <morecore+0x44>

0000065c <malloc>:

void*
malloc(uint nbytes)
{
 65c:	f3 0f 1e fb          	endbr32 
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	53                   	push   %ebx
 664:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 667:	8b 45 08             	mov    0x8(%ebp),%eax
 66a:	8d 58 07             	lea    0x7(%eax),%ebx
 66d:	c1 eb 03             	shr    $0x3,%ebx
 670:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 673:	8b 0d e4 09 00 00    	mov    0x9e4,%ecx
 679:	85 c9                	test   %ecx,%ecx
 67b:	74 04                	je     681 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 67d:	8b 01                	mov    (%ecx),%eax
 67f:	eb 4b                	jmp    6cc <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 681:	c7 05 e4 09 00 00 e8 	movl   $0x9e8,0x9e4
 688:	09 00 00 
 68b:	c7 05 e8 09 00 00 e8 	movl   $0x9e8,0x9e8
 692:	09 00 00 
    base.s.size = 0;
 695:	c7 05 ec 09 00 00 00 	movl   $0x0,0x9ec
 69c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 69f:	b9 e8 09 00 00       	mov    $0x9e8,%ecx
 6a4:	eb d7                	jmp    67d <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6a6:	74 1a                	je     6c2 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6a8:	29 da                	sub    %ebx,%edx
 6aa:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6ad:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6b0:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6b3:	89 0d e4 09 00 00    	mov    %ecx,0x9e4
      return (void*)(p + 1);
 6b9:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6bc:	83 c4 04             	add    $0x4,%esp
 6bf:	5b                   	pop    %ebx
 6c0:	5d                   	pop    %ebp
 6c1:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6c2:	8b 10                	mov    (%eax),%edx
 6c4:	89 11                	mov    %edx,(%ecx)
 6c6:	eb eb                	jmp    6b3 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6c8:	89 c1                	mov    %eax,%ecx
 6ca:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6cc:	8b 50 04             	mov    0x4(%eax),%edx
 6cf:	39 da                	cmp    %ebx,%edx
 6d1:	73 d3                	jae    6a6 <malloc+0x4a>
    if(p == freep)
 6d3:	39 05 e4 09 00 00    	cmp    %eax,0x9e4
 6d9:	75 ed                	jne    6c8 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 6db:	89 d8                	mov    %ebx,%eax
 6dd:	e8 2a ff ff ff       	call   60c <morecore>
 6e2:	85 c0                	test   %eax,%eax
 6e4:	75 e2                	jne    6c8 <malloc+0x6c>
 6e6:	eb d4                	jmp    6bc <malloc+0x60>
