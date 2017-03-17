
module m_ext
implicit none

integer:: g_n = 3
real(8),allocatable :: g_v(:,:)

contains

subroutine m_ext_allocate(n)
implicit none
integer:: n
 g_n = n
 if (allocated(g_v)) deallocate(g_v)
 allocate( g_v(n,n) )
 write(*,*)'alocate g_v with n=',n
end subroutine m_ext_allocate

subroutine m_ext_make_g_v(mode)
implicit none
character::mode
integer:: i,j ,n
 g_v = 0.0d0
 write(*,*)'mode=',mode
 n= g_n
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
end subroutine m_ext_make_g_v

end module m_ext

