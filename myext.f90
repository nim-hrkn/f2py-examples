

module m_mylib 
contains

subroutine init(mode,n,fac,a)
use m_ext
implicit none
character::mode
integer::n
real(8):: fac
real(8):: a(n,n)
  !f2py intent(in) mode
  !f2py intent(in) n
  !f2py intent(in) fac
  !f2py intent(out) a

call m_ext_allocate(n)
call m_ext_make_g_v(mode)

a = g_v * fac 
end subroutine init


subroutine vavbmc(n,m,a,b,c)
  implicit none
  integer n,m
  real(8) a(n)
  real(8) b(m)
  real(8) c(n,m)
  !f2py intent(in) n
  !f2py intent(in) m
  !f2py intent(in) a
  !f2py intent(in) b
  !f2py intent(out) c

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
  integer n
  real(8) a(n,n)
  real(8) b(n,n)
  real(8) c(n,n)
  !f2py intent(in) n
  !f2py intent(in) a
  !f2py intent(in) b
  !f2py intent(out) c

  integer:: i,j


  do i=1,n
     do j=1,n

        c(j,i) = a(j,i)+b(j,i)

     enddo
  enddo

end subroutine apb


subroutine apb_p(p,n,a,b,c)
  implicit none
  integer n
  real(8) p
  real(8) a(n,n)
  integer b(n,n)
  real(8) c(n,n)
  !f2py intent(in) p
  !f2py intent(in) n
  !f2py intent(in) a
  !f2py intent(in) b
  !f2py intent(out) c

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


