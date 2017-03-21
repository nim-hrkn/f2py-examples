
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


subroutine nparraytest(arr,n1,n2,arr2)
  implicit none
  integer n1, n2
  real(8) arr(n1,n2)
  real(8) arr2(n1,n2)
!f2py intent(in) n1
!f2py intent(in) n2
!f2py intent(in) arr
!f2py intent(out) arr2
  integer:: i1,i2
  write(*,*)'n1,n2=',n1,n2
  do i2=1,n2
    do i1=1,n1
      arr2(i1,i2)= arr(i1,i2)+100.0d0*i1
    enddo
  enddo
end subroutine nparraytest

