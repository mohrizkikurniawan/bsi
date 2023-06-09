*-----------------------------------------------------------------------------
* <Rating>-30</Rating>
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* Created by Moh Rizki Kurniawan
* Date : 08 Mei 2023
* service to check account for double passbook
*---------------------------------------------------------------------------------------------
    SUBROUTINE IDIB.MT.DOUBLE.PASSBOOK(USER.ID)

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.BSI.TH.DOUBLE.PASSBOOK
    $INSERT I_DOUBLE.PASSBOOK.COMMON

    GOSUB INIT
    GOSUB PROCESS

    RETURN
*---------------------------------------------------------------------------------------------
INIT:
*---------------------------------------------------------------------------------------------

    
    RETURN
*---------------------------------------------------------------------------------------------
PROCESS:
*---------------------------------------------------------------------------------------------
    
    CALL F.READ(FN.USER, USER.ID, R.USER.V, F.USER '')
    R.USER.V<User_SignOnOffLog>     = "NO"
    R.USER.V<User_SecurityMgmtL>    = "NO"
    R.USER.V<User_ApplicationLog>   = "NO"
    R.USER.V<User_FunctionIdLog>    = "NO"

    CALL F.WRITE(FN.USER, USER.ID, R.USER.V)
    CALL JOURNAL.UPDATE(USER.ID)

    CALL OCOMO("User : " : USER.ID : " succesfully non active log")

    RETURN
*---------------------------------------------------------------------------------------------
END





