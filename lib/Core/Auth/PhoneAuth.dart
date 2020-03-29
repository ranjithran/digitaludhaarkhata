import 'package:digitaludhaarkhata/Services/Locator.dart';
import 'package:digitaludhaarkhata/Services/NavigationServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:digitaludhaarkhata/routes/routename.dart' as routeNames;
import 'package:flutter/services.dart';

class PhoneAuth extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = "";

  Future<String> verifyPhone(phoneNo) async {
      
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this._verificationId = verId;
      // setState(() {
      //   this.status = AuthStatus.SMS_AUTH;
      // });
      // Navigator.of(context).pop();
      
      locator<NavigationService>().navigateToWithArguments(routeNames.signup2,verId);
      // return ;
    };
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      this._verificationId = verificationId;
      print("time out");
    };

    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: "+91"+phoneNo, // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
          codeSent:
              smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 20),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print("at VerifyPhonenumber" + phoneAuthCredential.toString());
          },
          verificationFailed: (AuthException exceptio) {
            print('${exceptio.message}');
          });

    } catch (e) {
      // handleError(e);
    }
    return _verificationId;
  }
  Future<void> signIn(smsOTP,vId) async {
    if (smsOTP.isNotEmpty) {
      try {
        final AuthCredential _phonecredential = PhoneAuthProvider.getCredential(
          verificationId: vId,
          smsCode: smsOTP,
        );
        
        _auth.signInWithCredential(_phonecredential).then((onValue){
          print(onValue.user.phoneNumber);
        }).whenComplete((){
          locator<NavigationService>().navigateTo(routeNames.home);
        });
        
      } catch (e) {
        // Logger.log("Sign ", message: e.toString());
        handleError(e);
      }
    }
  }

  handleError(PlatformException error) {
    print(error);
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        // FocusScope.of(context).requestFocus(new FocusNode());
        // setState(() {
        //   errorMessage = 'Invalid Code';
        // });

        break;
      case 'ERROR_SESSION_EXPIRED':
        print("ERROR_SESSION_EXPIRED for ran");
        
        break;
      case 'ERROR_CREDENTIAL_ALREADY_IN_USE':
        print("already in use");
        break;
      default:
        // setState(() {
        //   errorMessage = error.message;
        // });

        break;
    }
  }
}
