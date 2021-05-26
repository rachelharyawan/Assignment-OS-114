
_date:     file format elf32-i386


Disassembly of section .text:

00000000 <dayofweek>:
static char *days[] = {"Sun", "Mon", "Tue", "Wed",
  "Thu", "Fri", "Sat"};

static int
dayofweek(int y, int m, int d)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	89 c3                	mov    %eax,%ebx
  return (d+=m<3?y--:y-2,23*m/9+d+4+y/4-y/100+y/400)%7;
   7:	83 fa 02             	cmp    $0x2,%edx
   a:	7f 70                	jg     7c <dayofweek+0x7c>
   c:	89 c6                	mov    %eax,%esi
   e:	8d 58 ff             	lea    -0x1(%eax),%ebx
  11:	01 ce                	add    %ecx,%esi
  13:	6b ca 17             	imul   $0x17,%edx,%ecx
  16:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
  1b:	89 c8                	mov    %ecx,%eax
  1d:	f7 ea                	imul   %edx
  1f:	d1 fa                	sar    %edx
  21:	c1 f9 1f             	sar    $0x1f,%ecx
  24:	29 ca                	sub    %ecx,%edx
  26:	8d 44 32 04          	lea    0x4(%edx,%esi,1),%eax
  2a:	8d 4b 03             	lea    0x3(%ebx),%ecx
  2d:	85 db                	test   %ebx,%ebx
  2f:	0f 49 cb             	cmovns %ebx,%ecx
  32:	c1 f9 02             	sar    $0x2,%ecx
  35:	01 c1                	add    %eax,%ecx
  37:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  3c:	89 d8                	mov    %ebx,%eax
  3e:	f7 ea                	imul   %edx
  40:	89 d0                	mov    %edx,%eax
  42:	c1 f8 05             	sar    $0x5,%eax
  45:	c1 fb 1f             	sar    $0x1f,%ebx
  48:	89 de                	mov    %ebx,%esi
  4a:	29 c6                	sub    %eax,%esi
  4c:	01 f1                	add    %esi,%ecx
  4e:	c1 fa 07             	sar    $0x7,%edx
  51:	29 da                	sub    %ebx,%edx
  53:	01 d1                	add    %edx,%ecx
  55:	ba 93 24 49 92       	mov    $0x92492493,%edx
  5a:	89 c8                	mov    %ecx,%eax
  5c:	f7 ea                	imul   %edx
  5e:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
  61:	c1 f8 02             	sar    $0x2,%eax
  64:	89 ca                	mov    %ecx,%edx
  66:	c1 fa 1f             	sar    $0x1f,%edx
  69:	29 d0                	sub    %edx,%eax
  6b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  72:	29 c2                	sub    %eax,%edx
  74:	89 c8                	mov    %ecx,%eax
  76:	29 d0                	sub    %edx,%eax
}
  78:	5b                   	pop    %ebx
  79:	5e                   	pop    %esi
  7a:	5d                   	pop    %ebp
  7b:	c3                   	ret    
  return (d+=m<3?y--:y-2,23*m/9+d+4+y/4-y/100+y/400)%7;
  7c:	8d 70 fe             	lea    -0x2(%eax),%esi
  7f:	eb 90                	jmp    11 <dayofweek+0x11>

00000081 <main>:

int
main(int argc, char *argv[])
{
  81:	f3 0f 1e fb          	endbr32 
  85:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  89:	83 e4 f0             	and    $0xfffffff0,%esp
  8c:	ff 71 fc             	pushl  -0x4(%ecx)
  8f:	55                   	push   %ebp
  90:	89 e5                	mov    %esp,%ebp
  92:	57                   	push   %edi
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	51                   	push   %ecx
  96:	83 ec 54             	sub    $0x54,%esp
  int day;
  char *s;
  struct rtcdate r;

  if (date(&r)) {
  99:	8d 45 d0             	lea    -0x30(%ebp),%eax
  9c:	50                   	push   %eax
  9d:	e8 6c 04 00 00       	call   50e <date>
  a2:	83 c4 10             	add    $0x10,%esp
  a5:	85 c0                	test   %eax,%eax
  a7:	0f 85 d1 00 00 00    	jne    17e <main+0xfd>
    printf(2,"Error: date call failed. %s at line %d\n",
        __FILE__, __LINE__);
    exit();
  }

  day = dayofweek(r.year, r.month, r.day);
  ad:	8b 5d dc             	mov    -0x24(%ebp),%ebx
  b0:	8b 75 e0             	mov    -0x20(%ebp),%esi
  b3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  b6:	89 d9                	mov    %ebx,%ecx
  b8:	89 f2                	mov    %esi,%edx
  ba:	89 f8                	mov    %edi,%eax
  bc:	e8 3f ff ff ff       	call   0 <dayofweek>
  c1:	89 45 b0             	mov    %eax,-0x50(%ebp)
  s = r.hour < 12 ? "AM" : "PM";
  c4:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  c7:	83 f9 0b             	cmp    $0xb,%ecx
  ca:	0f 87 c6 00 00 00    	ja     196 <main+0x115>
  d0:	c7 45 c0 c3 08 00 00 	movl   $0x8c3,-0x40(%ebp)

  r.hour %= 12;
  d7:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
  dc:	89 c8                	mov    %ecx,%eax
  de:	f7 e2                	mul    %edx
  e0:	c1 ea 03             	shr    $0x3,%edx
  e3:	8d 04 52             	lea    (%edx,%edx,2),%eax
  e6:	c1 e0 02             	shl    $0x2,%eax
  e9:	29 c1                	sub    %eax,%ecx
  eb:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  if (r.hour == 0) r.hour = 12;
  ee:	75 07                	jne    f7 <main+0x76>
  f0:	c7 45 d8 0c 00 00 00 	movl   $0xc,-0x28(%ebp)

  printf(1, "%s %s%d %s %d %s%d:%s%d:%s%d %s UTC\n", days[day], PAD(r.day), r.day,
  f7:	8b 4d d0             	mov    -0x30(%ebp),%ecx
  fa:	83 f9 09             	cmp    $0x9,%ecx
  fd:	0f 87 9f 00 00 00    	ja     1a2 <main+0x121>
 103:	c7 45 bc c6 08 00 00 	movl   $0x8c6,-0x44(%ebp)
 10a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 10d:	83 fa 09             	cmp    $0x9,%edx
 110:	0f 87 98 00 00 00    	ja     1ae <main+0x12d>
 116:	c7 45 b8 c6 08 00 00 	movl   $0x8c6,-0x48(%ebp)
 11d:	8b 45 d8             	mov    -0x28(%ebp),%eax
 120:	83 f8 09             	cmp    $0x9,%eax
 123:	0f 87 91 00 00 00    	ja     1ba <main+0x139>
 129:	c7 45 b4 c6 08 00 00 	movl   $0x8c6,-0x4c(%ebp)
 130:	8b 34 b5 a0 09 00 00 	mov    0x9a0(,%esi,4),%esi
 137:	89 75 c4             	mov    %esi,-0x3c(%ebp)
 13a:	83 fb 09             	cmp    $0x9,%ebx
 13d:	0f 87 83 00 00 00    	ja     1c6 <main+0x145>
 143:	be c6 08 00 00       	mov    $0x8c6,%esi
 148:	83 ec 08             	sub    $0x8,%esp
 14b:	ff 75 c0             	pushl  -0x40(%ebp)
 14e:	51                   	push   %ecx
 14f:	ff 75 bc             	pushl  -0x44(%ebp)
 152:	52                   	push   %edx
 153:	ff 75 b8             	pushl  -0x48(%ebp)
 156:	50                   	push   %eax
 157:	ff 75 b4             	pushl  -0x4c(%ebp)
 15a:	57                   	push   %edi
 15b:	ff 75 c4             	pushl  -0x3c(%ebp)
 15e:	53                   	push   %ebx
 15f:	56                   	push   %esi
 160:	8b 45 b0             	mov    -0x50(%ebp),%eax
 163:	ff 34 85 80 09 00 00 	pushl  0x980(,%eax,4)
 16a:	68 48 09 00 00       	push   $0x948
 16f:	6a 01                	push   $0x1
 171:	e8 71 04 00 00       	call   5e7 <printf>
      months[r.month], r.year, PAD(r.hour), r.hour, PAD(r.minute), r.minute,
      PAD(r.second), r.second, s);

  exit();
 176:	83 c4 40             	add    $0x40,%esp
 179:	e8 e8 02 00 00       	call   466 <exit>
    printf(2,"Error: date call failed. %s at line %d\n",
 17e:	6a 1f                	push   $0x1f
 180:	68 c8 08 00 00       	push   $0x8c8
 185:	68 20 09 00 00       	push   $0x920
 18a:	6a 02                	push   $0x2
 18c:	e8 56 04 00 00       	call   5e7 <printf>
    exit();
 191:	e8 d0 02 00 00       	call   466 <exit>
  s = r.hour < 12 ? "AM" : "PM";
 196:	c7 45 c0 c0 08 00 00 	movl   $0x8c0,-0x40(%ebp)
 19d:	e9 35 ff ff ff       	jmp    d7 <main+0x56>
  printf(1, "%s %s%d %s %d %s%d:%s%d:%s%d %s UTC\n", days[day], PAD(r.day), r.day,
 1a2:	c7 45 bc da 09 00 00 	movl   $0x9da,-0x44(%ebp)
 1a9:	e9 5c ff ff ff       	jmp    10a <main+0x89>
 1ae:	c7 45 b8 da 09 00 00 	movl   $0x9da,-0x48(%ebp)
 1b5:	e9 63 ff ff ff       	jmp    11d <main+0x9c>
 1ba:	c7 45 b4 da 09 00 00 	movl   $0x9da,-0x4c(%ebp)
 1c1:	e9 6a ff ff ff       	jmp    130 <main+0xaf>
 1c6:	be da 09 00 00       	mov    $0x9da,%esi
 1cb:	e9 78 ff ff ff       	jmp    148 <main+0xc7>

000001d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	56                   	push   %esi
 1d8:	53                   	push   %ebx
 1d9:	8b 75 08             	mov    0x8(%ebp),%esi
 1dc:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1df:	89 f0                	mov    %esi,%eax
 1e1:	89 d1                	mov    %edx,%ecx
 1e3:	83 c2 01             	add    $0x1,%edx
 1e6:	89 c3                	mov    %eax,%ebx
 1e8:	83 c0 01             	add    $0x1,%eax
 1eb:	0f b6 09             	movzbl (%ecx),%ecx
 1ee:	88 0b                	mov    %cl,(%ebx)
 1f0:	84 c9                	test   %cl,%cl
 1f2:	75 ed                	jne    1e1 <strcpy+0x11>
    ;
  return os;
}
 1f4:	89 f0                	mov    %esi,%eax
 1f6:	5b                   	pop    %ebx
 1f7:	5e                   	pop    %esi
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    

000001fa <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1fa:	f3 0f 1e fb          	endbr32 
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
 201:	8b 4d 08             	mov    0x8(%ebp),%ecx
 204:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 207:	0f b6 01             	movzbl (%ecx),%eax
 20a:	84 c0                	test   %al,%al
 20c:	74 0c                	je     21a <strcmp+0x20>
 20e:	3a 02                	cmp    (%edx),%al
 210:	75 08                	jne    21a <strcmp+0x20>
    p++, q++;
 212:	83 c1 01             	add    $0x1,%ecx
 215:	83 c2 01             	add    $0x1,%edx
 218:	eb ed                	jmp    207 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 21a:	0f b6 c0             	movzbl %al,%eax
 21d:	0f b6 12             	movzbl (%edx),%edx
 220:	29 d0                	sub    %edx,%eax
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    

00000224 <strlen>:

uint
strlen(char *s)
{
 224:	f3 0f 1e fb          	endbr32 
 228:	55                   	push   %ebp
 229:	89 e5                	mov    %esp,%ebp
 22b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 22e:	b8 00 00 00 00       	mov    $0x0,%eax
 233:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 237:	74 05                	je     23e <strlen+0x1a>
 239:	83 c0 01             	add    $0x1,%eax
 23c:	eb f5                	jmp    233 <strlen+0xf>
    ;
  return n;
}
 23e:	5d                   	pop    %ebp
 23f:	c3                   	ret    

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	f3 0f 1e fb          	endbr32 
 244:	55                   	push   %ebp
 245:	89 e5                	mov    %esp,%ebp
 247:	57                   	push   %edi
 248:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 24b:	89 d7                	mov    %edx,%edi
 24d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 250:	8b 45 0c             	mov    0xc(%ebp),%eax
 253:	fc                   	cld    
 254:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 256:	89 d0                	mov    %edx,%eax
 258:	5f                   	pop    %edi
 259:	5d                   	pop    %ebp
 25a:	c3                   	ret    

0000025b <strchr>:

char*
strchr(const char *s, char c)
{
 25b:	f3 0f 1e fb          	endbr32 
 25f:	55                   	push   %ebp
 260:	89 e5                	mov    %esp,%ebp
 262:	8b 45 08             	mov    0x8(%ebp),%eax
 265:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 269:	0f b6 10             	movzbl (%eax),%edx
 26c:	84 d2                	test   %dl,%dl
 26e:	74 09                	je     279 <strchr+0x1e>
    if(*s == c)
 270:	38 ca                	cmp    %cl,%dl
 272:	74 0a                	je     27e <strchr+0x23>
  for(; *s; s++)
 274:	83 c0 01             	add    $0x1,%eax
 277:	eb f0                	jmp    269 <strchr+0xe>
      return (char*)s;
  return 0;
 279:	b8 00 00 00 00       	mov    $0x0,%eax
}
 27e:	5d                   	pop    %ebp
 27f:	c3                   	ret    

00000280 <gets>:

char*
gets(char *buf, int max)
{
 280:	f3 0f 1e fb          	endbr32 
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	57                   	push   %edi
 288:	56                   	push   %esi
 289:	53                   	push   %ebx
 28a:	83 ec 1c             	sub    $0x1c,%esp
 28d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 290:	bb 00 00 00 00       	mov    $0x0,%ebx
 295:	89 de                	mov    %ebx,%esi
 297:	83 c3 01             	add    $0x1,%ebx
 29a:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 29d:	7d 2e                	jge    2cd <gets+0x4d>
    cc = read(0, &c, 1);
 29f:	83 ec 04             	sub    $0x4,%esp
 2a2:	6a 01                	push   $0x1
 2a4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2a7:	50                   	push   %eax
 2a8:	6a 00                	push   $0x0
 2aa:	e8 cf 01 00 00       	call   47e <read>
    if(cc < 1)
 2af:	83 c4 10             	add    $0x10,%esp
 2b2:	85 c0                	test   %eax,%eax
 2b4:	7e 17                	jle    2cd <gets+0x4d>
      break;
    buf[i++] = c;
 2b6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2ba:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2bd:	3c 0a                	cmp    $0xa,%al
 2bf:	0f 94 c2             	sete   %dl
 2c2:	3c 0d                	cmp    $0xd,%al
 2c4:	0f 94 c0             	sete   %al
 2c7:	08 c2                	or     %al,%dl
 2c9:	74 ca                	je     295 <gets+0x15>
    buf[i++] = c;
 2cb:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2cd:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2d1:	89 f8                	mov    %edi,%eax
 2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    

000002db <stat>:

int
stat(char *n, struct stat *st)
{
 2db:	f3 0f 1e fb          	endbr32 
 2df:	55                   	push   %ebp
 2e0:	89 e5                	mov    %esp,%ebp
 2e2:	56                   	push   %esi
 2e3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e4:	83 ec 08             	sub    $0x8,%esp
 2e7:	6a 00                	push   $0x0
 2e9:	ff 75 08             	pushl  0x8(%ebp)
 2ec:	e8 b5 01 00 00       	call   4a6 <open>
  if(fd < 0)
 2f1:	83 c4 10             	add    $0x10,%esp
 2f4:	85 c0                	test   %eax,%eax
 2f6:	78 24                	js     31c <stat+0x41>
 2f8:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2fa:	83 ec 08             	sub    $0x8,%esp
 2fd:	ff 75 0c             	pushl  0xc(%ebp)
 300:	50                   	push   %eax
 301:	e8 b8 01 00 00       	call   4be <fstat>
 306:	89 c6                	mov    %eax,%esi
  close(fd);
 308:	89 1c 24             	mov    %ebx,(%esp)
 30b:	e8 7e 01 00 00       	call   48e <close>
  return r;
 310:	83 c4 10             	add    $0x10,%esp
}
 313:	89 f0                	mov    %esi,%eax
 315:	8d 65 f8             	lea    -0x8(%ebp),%esp
 318:	5b                   	pop    %ebx
 319:	5e                   	pop    %esi
 31a:	5d                   	pop    %ebp
 31b:	c3                   	ret    
    return -1;
 31c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 321:	eb f0                	jmp    313 <stat+0x38>

00000323 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 323:	f3 0f 1e fb          	endbr32 
 327:	55                   	push   %ebp
 328:	89 e5                	mov    %esp,%ebp
 32a:	57                   	push   %edi
 32b:	56                   	push   %esi
 32c:	53                   	push   %ebx
 32d:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 330:	0f b6 02             	movzbl (%edx),%eax
 333:	3c 20                	cmp    $0x20,%al
 335:	75 05                	jne    33c <atoi+0x19>
 337:	83 c2 01             	add    $0x1,%edx
 33a:	eb f4                	jmp    330 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 33c:	3c 2d                	cmp    $0x2d,%al
 33e:	74 1d                	je     35d <atoi+0x3a>
 340:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 345:	3c 2b                	cmp    $0x2b,%al
 347:	0f 94 c1             	sete   %cl
 34a:	3c 2d                	cmp    $0x2d,%al
 34c:	0f 94 c0             	sete   %al
 34f:	08 c1                	or     %al,%cl
 351:	74 03                	je     356 <atoi+0x33>
    s++;
 353:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 356:	b8 00 00 00 00       	mov    $0x0,%eax
 35b:	eb 17                	jmp    374 <atoi+0x51>
 35d:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 362:	eb e1                	jmp    345 <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 364:	8d 34 80             	lea    (%eax,%eax,4),%esi
 367:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 36a:	83 c2 01             	add    $0x1,%edx
 36d:	0f be c9             	movsbl %cl,%ecx
 370:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 374:	0f b6 0a             	movzbl (%edx),%ecx
 377:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 37a:	80 fb 09             	cmp    $0x9,%bl
 37d:	76 e5                	jbe    364 <atoi+0x41>
  return sign*n;
 37f:	0f af c7             	imul   %edi,%eax
}
 382:	5b                   	pop    %ebx
 383:	5e                   	pop    %esi
 384:	5f                   	pop    %edi
 385:	5d                   	pop    %ebp
 386:	c3                   	ret    

00000387 <atoo>:

int
atoo(const char *s)
{
 387:	f3 0f 1e fb          	endbr32 
 38b:	55                   	push   %ebp
 38c:	89 e5                	mov    %esp,%ebp
 38e:	57                   	push   %edi
 38f:	56                   	push   %esi
 390:	53                   	push   %ebx
 391:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 394:	0f b6 0a             	movzbl (%edx),%ecx
 397:	80 f9 20             	cmp    $0x20,%cl
 39a:	75 05                	jne    3a1 <atoo+0x1a>
 39c:	83 c2 01             	add    $0x1,%edx
 39f:	eb f3                	jmp    394 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 3a1:	80 f9 2d             	cmp    $0x2d,%cl
 3a4:	74 23                	je     3c9 <atoo+0x42>
 3a6:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 3ab:	80 f9 2b             	cmp    $0x2b,%cl
 3ae:	0f 94 c0             	sete   %al
 3b1:	89 c6                	mov    %eax,%esi
 3b3:	80 f9 2d             	cmp    $0x2d,%cl
 3b6:	0f 94 c0             	sete   %al
 3b9:	89 f3                	mov    %esi,%ebx
 3bb:	08 c3                	or     %al,%bl
 3bd:	74 03                	je     3c2 <atoo+0x3b>
    s++;
 3bf:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 3c2:	b8 00 00 00 00       	mov    $0x0,%eax
 3c7:	eb 11                	jmp    3da <atoo+0x53>
 3c9:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 3ce:	eb db                	jmp    3ab <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 3d0:	83 c2 01             	add    $0x1,%edx
 3d3:	0f be c9             	movsbl %cl,%ecx
 3d6:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 3da:	0f b6 0a             	movzbl (%edx),%ecx
 3dd:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 3e0:	80 fb 07             	cmp    $0x7,%bl
 3e3:	76 eb                	jbe    3d0 <atoo+0x49>
  return sign*n;
 3e5:	0f af c7             	imul   %edi,%eax
}
 3e8:	5b                   	pop    %ebx
 3e9:	5e                   	pop    %esi
 3ea:	5f                   	pop    %edi
 3eb:	5d                   	pop    %ebp
 3ec:	c3                   	ret    

000003ed <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 3ed:	f3 0f 1e fb          	endbr32 
 3f1:	55                   	push   %ebp
 3f2:	89 e5                	mov    %esp,%ebp
 3f4:	53                   	push   %ebx
 3f5:	8b 55 08             	mov    0x8(%ebp),%edx
 3f8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3fb:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 3fe:	eb 09                	jmp    409 <strncmp+0x1c>
      n--, p++, q++;
 400:	83 e8 01             	sub    $0x1,%eax
 403:	83 c2 01             	add    $0x1,%edx
 406:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 409:	85 c0                	test   %eax,%eax
 40b:	74 0b                	je     418 <strncmp+0x2b>
 40d:	0f b6 1a             	movzbl (%edx),%ebx
 410:	84 db                	test   %bl,%bl
 412:	74 04                	je     418 <strncmp+0x2b>
 414:	3a 19                	cmp    (%ecx),%bl
 416:	74 e8                	je     400 <strncmp+0x13>
    if(n == 0)
 418:	85 c0                	test   %eax,%eax
 41a:	74 0b                	je     427 <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 41c:	0f b6 02             	movzbl (%edx),%eax
 41f:	0f b6 11             	movzbl (%ecx),%edx
 422:	29 d0                	sub    %edx,%eax
}
 424:	5b                   	pop    %ebx
 425:	5d                   	pop    %ebp
 426:	c3                   	ret    
      return 0;
 427:	b8 00 00 00 00       	mov    $0x0,%eax
 42c:	eb f6                	jmp    424 <strncmp+0x37>

0000042e <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 42e:	f3 0f 1e fb          	endbr32 
 432:	55                   	push   %ebp
 433:	89 e5                	mov    %esp,%ebp
 435:	56                   	push   %esi
 436:	53                   	push   %ebx
 437:	8b 75 08             	mov    0x8(%ebp),%esi
 43a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 43d:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 440:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 442:	8d 58 ff             	lea    -0x1(%eax),%ebx
 445:	85 c0                	test   %eax,%eax
 447:	7e 0f                	jle    458 <memmove+0x2a>
    *dst++ = *src++;
 449:	0f b6 01             	movzbl (%ecx),%eax
 44c:	88 02                	mov    %al,(%edx)
 44e:	8d 49 01             	lea    0x1(%ecx),%ecx
 451:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 454:	89 d8                	mov    %ebx,%eax
 456:	eb ea                	jmp    442 <memmove+0x14>
  return vdst;
}
 458:	89 f0                	mov    %esi,%eax
 45a:	5b                   	pop    %ebx
 45b:	5e                   	pop    %esi
 45c:	5d                   	pop    %ebp
 45d:	c3                   	ret    

0000045e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 45e:	b8 01 00 00 00       	mov    $0x1,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <exit>:
SYSCALL(exit)
 466:	b8 02 00 00 00       	mov    $0x2,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <wait>:
SYSCALL(wait)
 46e:	b8 03 00 00 00       	mov    $0x3,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <pipe>:
SYSCALL(pipe)
 476:	b8 04 00 00 00       	mov    $0x4,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <read>:
SYSCALL(read)
 47e:	b8 05 00 00 00       	mov    $0x5,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <write>:
SYSCALL(write)
 486:	b8 10 00 00 00       	mov    $0x10,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <close>:
SYSCALL(close)
 48e:	b8 15 00 00 00       	mov    $0x15,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <kill>:
SYSCALL(kill)
 496:	b8 06 00 00 00       	mov    $0x6,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <exec>:
SYSCALL(exec)
 49e:	b8 07 00 00 00       	mov    $0x7,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <open>:
SYSCALL(open)
 4a6:	b8 0f 00 00 00       	mov    $0xf,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <mknod>:
SYSCALL(mknod)
 4ae:	b8 11 00 00 00       	mov    $0x11,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <unlink>:
SYSCALL(unlink)
 4b6:	b8 12 00 00 00       	mov    $0x12,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <fstat>:
SYSCALL(fstat)
 4be:	b8 08 00 00 00       	mov    $0x8,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <link>:
SYSCALL(link)
 4c6:	b8 13 00 00 00       	mov    $0x13,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <mkdir>:
SYSCALL(mkdir)
 4ce:	b8 14 00 00 00       	mov    $0x14,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret    

000004d6 <chdir>:
SYSCALL(chdir)
 4d6:	b8 09 00 00 00       	mov    $0x9,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret    

000004de <dup>:
SYSCALL(dup)
 4de:	b8 0a 00 00 00       	mov    $0xa,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <getpid>:
SYSCALL(getpid)
 4e6:	b8 0b 00 00 00       	mov    $0xb,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <sbrk>:
SYSCALL(sbrk)
 4ee:	b8 0c 00 00 00       	mov    $0xc,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret    

000004f6 <sleep>:
SYSCALL(sleep)
 4f6:	b8 0d 00 00 00       	mov    $0xd,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <uptime>:
SYSCALL(uptime)
 4fe:	b8 0e 00 00 00       	mov    $0xe,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret    

00000506 <halt>:
SYSCALL(halt)
 506:	b8 16 00 00 00       	mov    $0x16,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret    

0000050e <date>:
SYSCALL(date)
 50e:	b8 17 00 00 00       	mov    $0x17,%eax
 513:	cd 40                	int    $0x40
 515:	c3                   	ret    

00000516 <getuid>:
SYSCALL(getuid)
 516:	b8 18 00 00 00       	mov    $0x18,%eax
 51b:	cd 40                	int    $0x40
 51d:	c3                   	ret    

0000051e <getgid>:
SYSCALL(getgid)
 51e:	b8 19 00 00 00       	mov    $0x19,%eax
 523:	cd 40                	int    $0x40
 525:	c3                   	ret    

00000526 <getppid>:
SYSCALL(getppid)
 526:	b8 1a 00 00 00       	mov    $0x1a,%eax
 52b:	cd 40                	int    $0x40
 52d:	c3                   	ret    

0000052e <setuid>:
SYSCALL(setuid)
 52e:	b8 1b 00 00 00       	mov    $0x1b,%eax
 533:	cd 40                	int    $0x40
 535:	c3                   	ret    

00000536 <setgid>:
SYSCALL(setgid)
 536:	b8 1c 00 00 00       	mov    $0x1c,%eax
 53b:	cd 40                	int    $0x40
 53d:	c3                   	ret    

0000053e <getprocs>:
 53e:	b8 1d 00 00 00       	mov    $0x1d,%eax
 543:	cd 40                	int    $0x40
 545:	c3                   	ret    

00000546 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 546:	55                   	push   %ebp
 547:	89 e5                	mov    %esp,%ebp
 549:	83 ec 1c             	sub    $0x1c,%esp
 54c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 54f:	6a 01                	push   $0x1
 551:	8d 55 f4             	lea    -0xc(%ebp),%edx
 554:	52                   	push   %edx
 555:	50                   	push   %eax
 556:	e8 2b ff ff ff       	call   486 <write>
}
 55b:	83 c4 10             	add    $0x10,%esp
 55e:	c9                   	leave  
 55f:	c3                   	ret    

00000560 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	83 ec 2c             	sub    $0x2c,%esp
 569:	89 45 d0             	mov    %eax,-0x30(%ebp)
 56c:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 56e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 572:	0f 95 c2             	setne  %dl
 575:	89 f0                	mov    %esi,%eax
 577:	c1 e8 1f             	shr    $0x1f,%eax
 57a:	84 c2                	test   %al,%dl
 57c:	74 42                	je     5c0 <printint+0x60>
    neg = 1;
    x = -xx;
 57e:	f7 de                	neg    %esi
    neg = 1;
 580:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 587:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 58c:	89 f0                	mov    %esi,%eax
 58e:	ba 00 00 00 00       	mov    $0x0,%edx
 593:	f7 f1                	div    %ecx
 595:	89 df                	mov    %ebx,%edi
 597:	83 c3 01             	add    $0x1,%ebx
 59a:	0f b6 92 dc 09 00 00 	movzbl 0x9dc(%edx),%edx
 5a1:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5a5:	89 f2                	mov    %esi,%edx
 5a7:	89 c6                	mov    %eax,%esi
 5a9:	39 d1                	cmp    %edx,%ecx
 5ab:	76 df                	jbe    58c <printint+0x2c>
  if(neg)
 5ad:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5b1:	74 2f                	je     5e2 <printint+0x82>
    buf[i++] = '-';
 5b3:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5b8:	8d 5f 02             	lea    0x2(%edi),%ebx
 5bb:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5be:	eb 15                	jmp    5d5 <printint+0x75>
  neg = 0;
 5c0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5c7:	eb be                	jmp    587 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 5c9:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5ce:	89 f0                	mov    %esi,%eax
 5d0:	e8 71 ff ff ff       	call   546 <putc>
  while(--i >= 0)
 5d5:	83 eb 01             	sub    $0x1,%ebx
 5d8:	79 ef                	jns    5c9 <printint+0x69>
}
 5da:	83 c4 2c             	add    $0x2c,%esp
 5dd:	5b                   	pop    %ebx
 5de:	5e                   	pop    %esi
 5df:	5f                   	pop    %edi
 5e0:	5d                   	pop    %ebp
 5e1:	c3                   	ret    
 5e2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5e5:	eb ee                	jmp    5d5 <printint+0x75>

000005e7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5e7:	f3 0f 1e fb          	endbr32 
 5eb:	55                   	push   %ebp
 5ec:	89 e5                	mov    %esp,%ebp
 5ee:	57                   	push   %edi
 5ef:	56                   	push   %esi
 5f0:	53                   	push   %ebx
 5f1:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5f4:	8d 45 10             	lea    0x10(%ebp),%eax
 5f7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5fa:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5ff:	bb 00 00 00 00       	mov    $0x0,%ebx
 604:	eb 14                	jmp    61a <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 606:	89 fa                	mov    %edi,%edx
 608:	8b 45 08             	mov    0x8(%ebp),%eax
 60b:	e8 36 ff ff ff       	call   546 <putc>
 610:	eb 05                	jmp    617 <printf+0x30>
      }
    } else if(state == '%'){
 612:	83 fe 25             	cmp    $0x25,%esi
 615:	74 25                	je     63c <printf+0x55>
  for(i = 0; fmt[i]; i++){
 617:	83 c3 01             	add    $0x1,%ebx
 61a:	8b 45 0c             	mov    0xc(%ebp),%eax
 61d:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 621:	84 c0                	test   %al,%al
 623:	0f 84 23 01 00 00    	je     74c <printf+0x165>
    c = fmt[i] & 0xff;
 629:	0f be f8             	movsbl %al,%edi
 62c:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 62f:	85 f6                	test   %esi,%esi
 631:	75 df                	jne    612 <printf+0x2b>
      if(c == '%'){
 633:	83 f8 25             	cmp    $0x25,%eax
 636:	75 ce                	jne    606 <printf+0x1f>
        state = '%';
 638:	89 c6                	mov    %eax,%esi
 63a:	eb db                	jmp    617 <printf+0x30>
      if(c == 'd'){
 63c:	83 f8 64             	cmp    $0x64,%eax
 63f:	74 49                	je     68a <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 641:	83 f8 78             	cmp    $0x78,%eax
 644:	0f 94 c1             	sete   %cl
 647:	83 f8 70             	cmp    $0x70,%eax
 64a:	0f 94 c2             	sete   %dl
 64d:	08 d1                	or     %dl,%cl
 64f:	75 63                	jne    6b4 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 651:	83 f8 73             	cmp    $0x73,%eax
 654:	0f 84 84 00 00 00    	je     6de <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 65a:	83 f8 63             	cmp    $0x63,%eax
 65d:	0f 84 b7 00 00 00    	je     71a <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 663:	83 f8 25             	cmp    $0x25,%eax
 666:	0f 84 cc 00 00 00    	je     738 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 66c:	ba 25 00 00 00       	mov    $0x25,%edx
 671:	8b 45 08             	mov    0x8(%ebp),%eax
 674:	e8 cd fe ff ff       	call   546 <putc>
        putc(fd, c);
 679:	89 fa                	mov    %edi,%edx
 67b:	8b 45 08             	mov    0x8(%ebp),%eax
 67e:	e8 c3 fe ff ff       	call   546 <putc>
      }
      state = 0;
 683:	be 00 00 00 00       	mov    $0x0,%esi
 688:	eb 8d                	jmp    617 <printf+0x30>
        printint(fd, *ap, 10, 1);
 68a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 68d:	8b 17                	mov    (%edi),%edx
 68f:	83 ec 0c             	sub    $0xc,%esp
 692:	6a 01                	push   $0x1
 694:	b9 0a 00 00 00       	mov    $0xa,%ecx
 699:	8b 45 08             	mov    0x8(%ebp),%eax
 69c:	e8 bf fe ff ff       	call   560 <printint>
        ap++;
 6a1:	83 c7 04             	add    $0x4,%edi
 6a4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6a7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6aa:	be 00 00 00 00       	mov    $0x0,%esi
 6af:	e9 63 ff ff ff       	jmp    617 <printf+0x30>
        printint(fd, *ap, 16, 0);
 6b4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6b7:	8b 17                	mov    (%edi),%edx
 6b9:	83 ec 0c             	sub    $0xc,%esp
 6bc:	6a 00                	push   $0x0
 6be:	b9 10 00 00 00       	mov    $0x10,%ecx
 6c3:	8b 45 08             	mov    0x8(%ebp),%eax
 6c6:	e8 95 fe ff ff       	call   560 <printint>
        ap++;
 6cb:	83 c7 04             	add    $0x4,%edi
 6ce:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6d1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6d4:	be 00 00 00 00       	mov    $0x0,%esi
 6d9:	e9 39 ff ff ff       	jmp    617 <printf+0x30>
        s = (char*)*ap;
 6de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6e1:	8b 30                	mov    (%eax),%esi
        ap++;
 6e3:	83 c0 04             	add    $0x4,%eax
 6e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6e9:	85 f6                	test   %esi,%esi
 6eb:	75 28                	jne    715 <printf+0x12e>
          s = "(null)";
 6ed:	be d4 09 00 00       	mov    $0x9d4,%esi
 6f2:	8b 7d 08             	mov    0x8(%ebp),%edi
 6f5:	eb 0d                	jmp    704 <printf+0x11d>
          putc(fd, *s);
 6f7:	0f be d2             	movsbl %dl,%edx
 6fa:	89 f8                	mov    %edi,%eax
 6fc:	e8 45 fe ff ff       	call   546 <putc>
          s++;
 701:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 704:	0f b6 16             	movzbl (%esi),%edx
 707:	84 d2                	test   %dl,%dl
 709:	75 ec                	jne    6f7 <printf+0x110>
      state = 0;
 70b:	be 00 00 00 00       	mov    $0x0,%esi
 710:	e9 02 ff ff ff       	jmp    617 <printf+0x30>
 715:	8b 7d 08             	mov    0x8(%ebp),%edi
 718:	eb ea                	jmp    704 <printf+0x11d>
        putc(fd, *ap);
 71a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 71d:	0f be 17             	movsbl (%edi),%edx
 720:	8b 45 08             	mov    0x8(%ebp),%eax
 723:	e8 1e fe ff ff       	call   546 <putc>
        ap++;
 728:	83 c7 04             	add    $0x4,%edi
 72b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 72e:	be 00 00 00 00       	mov    $0x0,%esi
 733:	e9 df fe ff ff       	jmp    617 <printf+0x30>
        putc(fd, c);
 738:	89 fa                	mov    %edi,%edx
 73a:	8b 45 08             	mov    0x8(%ebp),%eax
 73d:	e8 04 fe ff ff       	call   546 <putc>
      state = 0;
 742:	be 00 00 00 00       	mov    $0x0,%esi
 747:	e9 cb fe ff ff       	jmp    617 <printf+0x30>
    }
  }
}
 74c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 74f:	5b                   	pop    %ebx
 750:	5e                   	pop    %esi
 751:	5f                   	pop    %edi
 752:	5d                   	pop    %ebp
 753:	c3                   	ret    

00000754 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 754:	f3 0f 1e fb          	endbr32 
 758:	55                   	push   %ebp
 759:	89 e5                	mov    %esp,%ebp
 75b:	57                   	push   %edi
 75c:	56                   	push   %esi
 75d:	53                   	push   %ebx
 75e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 761:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 764:	a1 10 0d 00 00       	mov    0xd10,%eax
 769:	eb 02                	jmp    76d <free+0x19>
 76b:	89 d0                	mov    %edx,%eax
 76d:	39 c8                	cmp    %ecx,%eax
 76f:	73 04                	jae    775 <free+0x21>
 771:	39 08                	cmp    %ecx,(%eax)
 773:	77 12                	ja     787 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 775:	8b 10                	mov    (%eax),%edx
 777:	39 c2                	cmp    %eax,%edx
 779:	77 f0                	ja     76b <free+0x17>
 77b:	39 c8                	cmp    %ecx,%eax
 77d:	72 08                	jb     787 <free+0x33>
 77f:	39 ca                	cmp    %ecx,%edx
 781:	77 04                	ja     787 <free+0x33>
 783:	89 d0                	mov    %edx,%eax
 785:	eb e6                	jmp    76d <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 787:	8b 73 fc             	mov    -0x4(%ebx),%esi
 78a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 78d:	8b 10                	mov    (%eax),%edx
 78f:	39 d7                	cmp    %edx,%edi
 791:	74 19                	je     7ac <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 793:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 796:	8b 50 04             	mov    0x4(%eax),%edx
 799:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 79c:	39 ce                	cmp    %ecx,%esi
 79e:	74 1b                	je     7bb <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7a0:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7a2:	a3 10 0d 00 00       	mov    %eax,0xd10
}
 7a7:	5b                   	pop    %ebx
 7a8:	5e                   	pop    %esi
 7a9:	5f                   	pop    %edi
 7aa:	5d                   	pop    %ebp
 7ab:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7ac:	03 72 04             	add    0x4(%edx),%esi
 7af:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b2:	8b 10                	mov    (%eax),%edx
 7b4:	8b 12                	mov    (%edx),%edx
 7b6:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7b9:	eb db                	jmp    796 <free+0x42>
    p->s.size += bp->s.size;
 7bb:	03 53 fc             	add    -0x4(%ebx),%edx
 7be:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7c1:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7c4:	89 10                	mov    %edx,(%eax)
 7c6:	eb da                	jmp    7a2 <free+0x4e>

000007c8 <morecore>:

static Header*
morecore(uint nu)
{
 7c8:	55                   	push   %ebp
 7c9:	89 e5                	mov    %esp,%ebp
 7cb:	53                   	push   %ebx
 7cc:	83 ec 04             	sub    $0x4,%esp
 7cf:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7d1:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7d6:	77 05                	ja     7dd <morecore+0x15>
    nu = 4096;
 7d8:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7dd:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7e4:	83 ec 0c             	sub    $0xc,%esp
 7e7:	50                   	push   %eax
 7e8:	e8 01 fd ff ff       	call   4ee <sbrk>
  if(p == (char*)-1)
 7ed:	83 c4 10             	add    $0x10,%esp
 7f0:	83 f8 ff             	cmp    $0xffffffff,%eax
 7f3:	74 1c                	je     811 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7f5:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7f8:	83 c0 08             	add    $0x8,%eax
 7fb:	83 ec 0c             	sub    $0xc,%esp
 7fe:	50                   	push   %eax
 7ff:	e8 50 ff ff ff       	call   754 <free>
  return freep;
 804:	a1 10 0d 00 00       	mov    0xd10,%eax
 809:	83 c4 10             	add    $0x10,%esp
}
 80c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 80f:	c9                   	leave  
 810:	c3                   	ret    
    return 0;
 811:	b8 00 00 00 00       	mov    $0x0,%eax
 816:	eb f4                	jmp    80c <morecore+0x44>

00000818 <malloc>:

void*
malloc(uint nbytes)
{
 818:	f3 0f 1e fb          	endbr32 
 81c:	55                   	push   %ebp
 81d:	89 e5                	mov    %esp,%ebp
 81f:	53                   	push   %ebx
 820:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 823:	8b 45 08             	mov    0x8(%ebp),%eax
 826:	8d 58 07             	lea    0x7(%eax),%ebx
 829:	c1 eb 03             	shr    $0x3,%ebx
 82c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 82f:	8b 0d 10 0d 00 00    	mov    0xd10,%ecx
 835:	85 c9                	test   %ecx,%ecx
 837:	74 04                	je     83d <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 839:	8b 01                	mov    (%ecx),%eax
 83b:	eb 4b                	jmp    888 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 83d:	c7 05 10 0d 00 00 14 	movl   $0xd14,0xd10
 844:	0d 00 00 
 847:	c7 05 14 0d 00 00 14 	movl   $0xd14,0xd14
 84e:	0d 00 00 
    base.s.size = 0;
 851:	c7 05 18 0d 00 00 00 	movl   $0x0,0xd18
 858:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 85b:	b9 14 0d 00 00       	mov    $0xd14,%ecx
 860:	eb d7                	jmp    839 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 862:	74 1a                	je     87e <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 864:	29 da                	sub    %ebx,%edx
 866:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 869:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 86c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 86f:	89 0d 10 0d 00 00    	mov    %ecx,0xd10
      return (void*)(p + 1);
 875:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 878:	83 c4 04             	add    $0x4,%esp
 87b:	5b                   	pop    %ebx
 87c:	5d                   	pop    %ebp
 87d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 87e:	8b 10                	mov    (%eax),%edx
 880:	89 11                	mov    %edx,(%ecx)
 882:	eb eb                	jmp    86f <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 884:	89 c1                	mov    %eax,%ecx
 886:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 888:	8b 50 04             	mov    0x4(%eax),%edx
 88b:	39 da                	cmp    %ebx,%edx
 88d:	73 d3                	jae    862 <malloc+0x4a>
    if(p == freep)
 88f:	39 05 10 0d 00 00    	cmp    %eax,0xd10
 895:	75 ed                	jne    884 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 897:	89 d8                	mov    %ebx,%eax
 899:	e8 2a ff ff ff       	call   7c8 <morecore>
 89e:	85 c0                	test   %eax,%eax
 8a0:	75 e2                	jne    884 <malloc+0x6c>
 8a2:	eb d4                	jmp    878 <malloc+0x60>
