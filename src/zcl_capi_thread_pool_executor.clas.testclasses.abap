
CLASS ltc_capi_thread_pool_executor DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA:
      mo_cut TYPE REF TO zcl_capi_thread_pool_executor.  "class under test

    CLASS-METHODS: class_setup.
    CLASS-METHODS: class_teardown.
    METHODS: setup.
    METHODS: teardown.
    METHODS: invoke_all FOR TESTING.
ENDCLASS.       "ltc_Capi_Thread_Pool_Executor


CLASS ltc_capi_thread_pool_executor IMPLEMENTATION.

  METHOD class_setup.

  ENDMETHOD.


  METHOD class_teardown.

  ENDMETHOD.


  METHOD setup.
    DATA lo_capi_message_handler TYPE REF TO zif_capi_message_handler.

    mo_cut = zcl_capi_executors=>new_fixed_thread_pool(
                iv_server_group         = 'parallel_generators'
                io_capi_message_handler = lo_capi_message_handler
             ).

  ENDMETHOD.


  METHOD teardown.

  ENDMETHOD.


  METHOD invoke_all.

    DATA lo_tasks TYPE REF TO zcl_capi_collection.
    DATA lo_results TYPE REF TO zif_capi_collection.

    CREATE OBJECT lo_tasks.

    lo_results = mo_cut->zif_capi_executor_service~invoke_all( lo_tasks ).

    IF lo_results IS NOT BOUND.
      cl_aunit_assert=>fail( msg = 'Testing invoke_all' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
