package com.example.helloandroid;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class mHelloAndroidActivity extends Activity {
	private TextView mSizeDisplay;
	private TextView mResultDisplay;
    private Button mPickNumber1;
    private Button mPickNumber2;
    private Button mPickNumber3;
    private Button mPickNumber4;
    private Button mPickNumber5;
    private Button mPickNumber6;
    private Button mPickNumber7;
    private Button mPickNumber8;
    private Button mPickNumber9;
    private Button mPickNumber0;
    private Button mPickBackspace;
    private Button mPickSpace;
    private Button mPickEnter;
    private String mStr, mResult;
    private String[] mTmp;
    long mX, mY;
    double mA, mB, mC, mD;

    /** Called when the activity is first created. */
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        // capture our View elements
        mSizeDisplay = (TextView) findViewById(R.id.sizeDisplay);
        mResultDisplay = (TextView) findViewById(R.id.resultDisplay);
        mPickNumber1 = (Button) findViewById(R.id.pickNumber1);
        mPickNumber2 = (Button) findViewById(R.id.pickNumber2);
        mPickNumber3 = (Button) findViewById(R.id.pickNumber3);
        mPickNumber4 = (Button) findViewById(R.id.pickNumber4);
        mPickNumber5 = (Button) findViewById(R.id.pickNumber5);
        mPickNumber6 = (Button) findViewById(R.id.pickNumber6);
        mPickNumber7 = (Button) findViewById(R.id.pickNumber7);
        mPickNumber8 = (Button) findViewById(R.id.pickNumber8);
        mPickNumber9 = (Button) findViewById(R.id.pickNumber9);
        mPickNumber0 = (Button) findViewById(R.id.pickNumber0);
        mPickBackspace = (Button) findViewById(R.id.pickBackspace);
        mPickSpace = (Button) findViewById(R.id.pickSpace);
        mPickEnter = (Button) findViewById(R.id.pickEnter);
        
        // add a click listener to the button
        mPickNumber1.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            	mStr = mStr + "1";
            	updateDisplay();
            }
        });
        mPickNumber2.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            	mStr = mStr + "2";
            	updateDisplay();
            }
        });
        mPickNumber3.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            	mStr = mStr + "3";
            	updateDisplay();
            }
        });
        mPickNumber4.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            	mStr = mStr + "4";
            	updateDisplay();
            }
        });
        mPickNumber5.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            	mStr = mStr + "5";
            	updateDisplay();
            }
        });
        mPickNumber6.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            	mStr = mStr + "6";
            	updateDisplay();
            }
        });
        mPickNumber7.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            	mStr = mStr + "7";
            	updateDisplay();
            }
        });
        mPickNumber8.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            	mStr = mStr + "8";
            	updateDisplay();
            }
        });
        mPickNumber9.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            	mStr = mStr + "9";
            	updateDisplay();
            }
        });
        mPickNumber0.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            	mStr = mStr + "0";
            	updateDisplay();
            }
        });
        mPickBackspace.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            	//StringBuilder mStr = new StringBuilder().deleteCharAt(0);
            	if (mStr.length() > 0) {
            		// Remove last char ( work like backspace )
            		mStr = mStr.substring(0, mStr.length()-1);
            	}
            	updateDisplay();
            }
        });
        mPickSpace.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            	mStr = mStr + " ";
            	updateDisplay();
            }
        });
        mPickEnter.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            	// a teraz przeliczamy ;D
            	mTmp = mStr.split(" ");
            	// Split String into numbers and convert them with precise to 0.1 [mm]
            	mX = Math.round((Integer.parseInt(mTmp[0])*2.54)/100);
            	mY = Math.round((Integer.parseInt(mTmp[1])*2.54)/100);
            	// Marginesy
            	mX = mX + 8;
            	mY = mY + 15;
            	mA = Math.round((1245.0/mX) * 10)/10.0;
            	mB = Math.round((1092.0/mY) * 10)/10.0;
            	mC = Math.round((1092.0/mX) * 10)/10.0;
            	mD = Math.round((1245.0/mY) * 10)/10.0;

            	mResult = "Wymiary formatki: "+ mX + " x " + mY +"\n";
            	mResult = mResult + mA +" x "+ mB;
            	mResult = mResult +" 1092x"+ (1245-(int)mA*mX);
            	mResult = mResult +" 1245x"+ (1092-(int)mB*mY) +"\n";
            	mResult = mResult + mC +" x "+ mD;
            	mResult = mResult +" 1245x"+ (1092-(int)mC*mX);
            	mResult = mResult +" 1092x"+ (1245-(int)mD*mY) +"\n";
            	updateDisplay();
            	updateResultDisplay();
            }
        });

        // get the input
        mStr = "";

        // display the current input (this method is below)
        updateDisplay();

    }

    // updates the inputDisplay
    private void updateDisplay() {
        mSizeDisplay.setText(
            new StringBuilder()
                    .append(mStr));
    }
    // updates the results in the outputResultDisplay
    private void updateResultDisplay() {
        mResultDisplay.setText(
            //new StringBuilder()
            //        .append(mResult));
        	mResult);
    }
}