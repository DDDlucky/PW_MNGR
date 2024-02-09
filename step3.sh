#!/bin/bash
while true
do
  echo "パスワードマネージャーへようこそ！"
  echo "GPGのメールアドレスを入力してください"
  read gpgUser


  echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
  read choice

  case $choice in
    "Add Password")
      echo "サービス名を入力してください："
      read serviceName
      echo "ユーザー名を入力してください："
      read userName
      echo "パスワードを入力してください："
      read passWord
      gpg -d password.gpg > tmp.txt 2> /dev/null
      echo "$serviceName:$userName:$passWord" >> password.txt
      echo "パスワードの追加は成功しました。"
      gpg -r "$gpgUser" -e -o password.gpg tmp.txt
    ;;

    "Get Password")
      echo "サービス名を入力してください："
      read serviceName
      gpg -d password.gpg > tmp.txt 2> /dev/null
      passWord=$(grep "^$serviceName" password.txt| cut -d : -f 3)
       if [ -z "$passWord" ]
       then
        echo "そのサービスは登録されていません。"
       else
        echo "サービス名：$serviceName"
        echo "ユーザー名：$(grep "^$serviceName" password.txt| cut -d : -f 2)"
        echo "パスワード：$passWord"
       fi
    ;;

    "Exit")
      echo "Thank you!"
      exit
    ;;
    *)
      echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
    ;;
  esac
done
