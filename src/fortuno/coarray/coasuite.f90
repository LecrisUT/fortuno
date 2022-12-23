module fortuno_coarray_coasuite
  use fortuno_coarray_coatest, only : coa_test_base
  use fortuno_suitebase, only : suite_base, init_suite_base
  implicit none

  private
  public :: coa_suite, coa_suite_base, coa_suite_base_cls


  type, extends(suite_base) :: coa_suite_base
  contains
    procedure :: set_up => coa_suite_base_set_up
    procedure :: tear_down => coa_suite_base_tear_down
  end type coa_suite_base


  type :: coa_suite_base_cls
    class(coa_suite_base), allocatable :: instance
  end type coa_suite_base_cls


  type, extends(coa_suite_base) :: coa_suite
  end type coa_suite


  interface coa_suite
    module procedure new_coa_suite
  end interface coa_suite

contains


  subroutine coa_suite_base_set_up(this)
    class(coa_suite_base), intent(inout) :: this
  end subroutine coa_suite_base_set_up


  subroutine coa_suite_base_tear_down(this)
    class(coa_suite_base), intent(inout) :: this
  end subroutine coa_suite_base_tear_down


  function new_coa_suite(name, tests) result(this)
    character(*), intent(in) :: name
    class(coa_test_base), optional, intent(in) :: tests(:)
    type(coa_suite) :: this

    call init_suite_base(this, name, tests)

  end function new_coa_suite

end module fortuno_coarray_coasuite