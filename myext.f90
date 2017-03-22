

module m_mylib 
contains

subroutine init(mode,n,fac,a)
use m_ext
implicit none
character,intent(in)::mode
integer,intent(in)::n
real(8),intent(in):: fac
real(8),intent(out):: a(n,n)

call m_ext_allocate(n)
call m_ext_make_g_v(mode)

a = g_v * fac 
end subroutine init


subroutine vavbmc(n,m,a,b,c)
  implicit none
  integer,intent(in):: n,m
  real(8),intent(in):: a(n)
  real(8),intent(in):: b(m)
  real(8),intent(out):: c(n,m)

  integer:: i,j

  write(*,*)'n,m=',n,m

  do i=1,m
     do j=1,n

        c(j,i) = a(j)*b(i)

     enddo
  enddo

end subroutine vavbmc



subroutine apb(n,a,b,c)
  implicit none
  integer,intent(in):: n
  real(8),intent(in):: a(n,n)
  real(8),intent(in):: b(n,n)
  real(8),intent(out):: c(n,n)

  integer:: i,j


  do i=1,n
     do j=1,n

        c(j,i) = a(j,i)+b(j,i)

     enddo
  enddo

end subroutine apb


subroutine apb_p(p,n,a,b,c)
  implicit none
  integer,intent(in):: n
  real(8),intent(in):: p
  real(8),intent(in):: a(n,n)
  integer,intent(in):: b(n,n)
  real(8),intent(out):: c(n,n)

  integer:: i,j

  write(*,*)'int(b)'
  write(*,'(4I10)')b

  do i=1,n
     do j=1,n

        c(j,i) = (a(j,i)+b(j,i))*p 

     enddo
  enddo

  c= c*p 

end subroutine apb_p


end module m_mylib 


