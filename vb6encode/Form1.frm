VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   6225
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   7785
   LinkTopic       =   "Form1"
   ScaleHeight     =   6225
   ScaleWidth      =   7785
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdEncodeUrlParams 
      Caption         =   "encodeUrlParams"
      Height          =   615
      Left            =   5640
      TabIndex        =   18
      Top             =   5520
      Width           =   1695
   End
   Begin VB.CommandButton cmdAESdec 
      Caption         =   "AES����"
      Height          =   495
      Left            =   5760
      TabIndex        =   17
      Top             =   4920
      Width           =   975
   End
   Begin VB.CommandButton cmdAESenc 
      Caption         =   "AES����"
      Height          =   495
      Left            =   5760
      TabIndex        =   16
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmdUTF8 
      Caption         =   "UTF8����"
      Height          =   375
      Left            =   5520
      TabIndex        =   15
      Top             =   3240
      Width           =   1575
   End
   Begin VB.CommandButton cmdUTF8dec 
      Caption         =   "UTF8����"
      Height          =   375
      Left            =   5520
      TabIndex        =   14
      Top             =   3600
      Width           =   1575
   End
   Begin VB.CommandButton cmdUTF8URLdec 
      Caption         =   "UTF8 URL����"
      Height          =   375
      Left            =   5520
      TabIndex        =   13
      Top             =   2400
      Width           =   1575
   End
   Begin VB.CommandButton cmdUTF8URLenc 
      Caption         =   "UTF8 URL����"
      Height          =   375
      Left            =   5520
      TabIndex        =   12
      Top             =   2040
      Width           =   1575
   End
   Begin VB.CommandButton cmdURLdec 
      Caption         =   "URL����"
      Height          =   375
      Left            =   5520
      TabIndex        =   11
      Top             =   1440
      Width           =   1575
   End
   Begin VB.CommandButton cmdURLenc 
      Caption         =   "URL����"
      Height          =   375
      Left            =   5520
      TabIndex        =   10
      Top             =   1080
      Width           =   1575
   End
   Begin VB.CommandButton cmdBase64dec 
      Caption         =   "BASE64����"
      Height          =   375
      Left            =   5520
      TabIndex        =   9
      Top             =   480
      Width           =   1575
   End
   Begin VB.CommandButton cmdBase64 
      Caption         =   "BASE64����"
      Height          =   375
      Left            =   5520
      TabIndex        =   8
      Top             =   120
      Width           =   1575
   End
   Begin VB.TextBox txtKey 
      Height          =   375
      Left            =   1560
      TabIndex        =   3
      Text            =   "12345678"
      Top             =   120
      Width           =   1575
   End
   Begin VB.TextBox txtSource 
      Height          =   1560
      Left            =   1560
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Form1.frx":0000
      Top             =   600
      Width           =   3735
   End
   Begin VB.TextBox txtEnc 
      Height          =   1695
      Left            =   1560
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Form1.frx":0006
      Top             =   2280
      Width           =   3735
   End
   Begin VB.TextBox txtDec 
      Height          =   1935
      IMEMode         =   3  'DISABLE
      Left            =   1560
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Form1.frx":000C
      Top             =   4080
      Width           =   3735
   End
   Begin VB.Label Label4 
      Caption         =   "���ܣ�"
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   4080
      Width           =   1095
   End
   Begin VB.Label Label3 
      Caption         =   "���ܺ��ַ���"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   2400
      Width           =   1095
   End
   Begin VB.Label Label2 
      Caption         =   "�������ַ���"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   600
      Width           =   1095
   End
   Begin VB.Label Label1 
      Caption         =   "Key"
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   120
      Width           =   1095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Private Sub cmdAESdec_Click()
    txtDec.Text = utf8AESBase64decode(txtEnc.Text, txtKey.Text)
End Sub

Private Sub cmdAESenc_Click()
    txtEnc.Text = utf8AESBase64encode(txtSource.Text, txtKey.Text)
End Sub

Private Sub cmdBase64_Click()
    txtEnc.Text = Base64Encode(ToUTF8Bytes(txtSource.Text))
End Sub

Private Sub cmdBase64dec_Click()
    txtDec.Text = FromUTF8Bytes(Base64Decode(txtEnc.Text))
End Sub


Private Sub cmdEncodeUrlParams_Click()
    txtEnc.Text = encodeUrlParams(txtSource.Text, txtKey.Text)
End Sub

Private Sub cmdURLdec_Click()
    txtDec.Text = URLDecode(txtEnc.Text)
End Sub

Private Sub cmdURLenc_Click()
    txtEnc.Text = URLEncode(txtSource.Text)
End Sub

Private Sub cmdUTF8_Click()
    Dim tmp() As Byte
    tmp = ToUTF8Bytes(txtSource.Text)
    
    txtEnc.Text = Base64Encode(tmp)
    
    txtDec.Text = FromUTF8Bytes(tmp())

End Sub

Private Sub cmdUTF8dec_Click()
    txtDec.Text = FromUTF8Bytes(Base64Decode(txtEnc.Text))
End Sub

Private Sub cmdUTF8URLdec_Click()
    txtDec.Text = UrlDecode_Utf8(txtEnc.Text)
End Sub

Private Sub cmdUTF8URLenc_Click()
    'txtEnc.Text = UTF8_URLEncode(txtSource.Text)
    txtEnc.Text = UrlEncode_Utf8(txtSource.Text)
End Sub



