package com.nis.view;

import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;

        import java.io.*;

//import javax.comm.*;
        import gnu.io.CommPort;
        import gnu.io.CommPortIdentifier;
        import gnu.io.SerialPort;


public class SMSServlet{
    static CommPortIdentifier portId;

    OutputStream outputStream;

    SerialPort serialPort;

    public SMSServlet(){}

    public  void SendSms(String comPort,String ph,String msg)
    {
        try
        {

            portId = CommPortIdentifier.getPortIdentifier(comPort);

            serialPort = (SerialPort) portId.open("sms", 2000);

            outputStream = serialPort.getOutputStream();



            serialPort.setSerialPortParams(9600,
                    SerialPort.DATABITS_8,
                    SerialPort.STOPBITS_1,
                    SerialPort.PARITY_NONE);

            outputStream.write("AT\r".getBytes());
            Thread.sleep(500);


            outputStream.write("AT+CMGF=1\r".getBytes());
            Thread.sleep(2000);
            String p="AT+CMGS=\"" + ph + "\"\r";
            outputStream.write(p.getBytes());
            Thread.sleep(2000);
            String m=msg + (char)26 + "\r";
            outputStream.write(m.getBytes());
            Thread.sleep(2000);

        }
        catch (Exception e)
        {
            System.out.println(e);
        }
    }


    public  void Dial(String comPort,String ph)
    {
        try
        {

            portId = CommPortIdentifier.getPortIdentifier(comPort);

            serialPort = (SerialPort) portId.open("sms", 2000);

            outputStream = serialPort.getOutputStream();



            serialPort.setSerialPortParams(9600,
                    SerialPort.DATABITS_8,
                    SerialPort.STOPBITS_1,
                    SerialPort.PARITY_NONE);

            outputStream.write("AT\r".getBytes());
            Thread.sleep(500);


            outputStream.write(("ATD"+ph+";\r").getBytes());
            Thread.sleep(2000);

        }
        catch (Exception e)
        {
            System.out.println(e);
        }
    }



}
