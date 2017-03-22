
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


!subroutine nparraytest(arr,n1,n2,arr2)
subroutine nparraytest(arr,n2,arr2)
  implicit none
  integer,parameter:: n1=3
  integer,intent(in):: n2
  real(8),intent(in):: arr(n1,n2)
  real(8),intent(out):: arr2(n1,n2)
  integer:: i1,i2
  write(*,*)'n1,n2=',n1,n2
  do i2=1,n2
    do i1=1,n1
      arr2(i1,i2)= arr(i1,i2)+100.0d0*i1
    enddo
  enddo
end subroutine nparraytest


subroutine nparraytest2(arr,n1,n2,arr2)
  implicit none
  integer,intent(in):: n1, n2
  real(8),intent(in):: arr(0:n1,0:n2)
  real(8),intent(out):: arr2(0:n1,0:n2)
  integer:: i1,i2
  write(*,*)'n1,n2=',n1,n2
  write(*,*)'accessing 0:n1,0:n2'
  do i2=0,n2
    do i1=0,n1
      arr2(i1,i2)= arr(i1,i2)+100.0d0*i1
    enddo
  enddo
end subroutine nparraytest2

