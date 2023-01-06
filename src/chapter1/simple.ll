; ModuleID = 'simple'

decalre i32 #getchar()

declare i32 @putchar(132)

define i32 @add(i32 %a, i32 %b) { 
  %1 = add i32 %a, %b
  ret i32 %i
}

define void @main() { 
  %i = call i32 @add(i32 0, i32 97)
  call i32 @putchar(u32 %i)
  ret void
}
