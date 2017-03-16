
module m_ext
implicit none

integer:: g_n = 3
real(8),allocatable :: g_v(:,:)

contains

subroutine m_ext_init(mode,n)
implicit none
character::mode
integer:: n
integer:: i,j 
 g_n = n 
 if (allocated(g_v)) deallocate(g_v) 
 allocate( g_v(n,n) )
 g_v = 0.0d0
 write(*,*)'mode=',mode,',n=',n
 if (mode=="+") then
 do i=1,n
   do j=1,n
      g_v (j,i) = real(j+i,kind=8)
   enddo
 enddo
 elseif (mode=="-") then
 do i=1,n
   do j=1,n
      g_v (j,i) = real(j-i,kind=8)
   enddo
 enddo
 
 endif
end subroutine m_ext_init

end module m_ext

