#!/bin/bash
echo "パスワードマネージャーへようこそ！"
echo "サービス名を入力してください："
read serviceName

echo "ユーザー名を入力してください："
read userName

echo "パスワードを入力してください："
read passWord

echo "$serviceName:$userName:$passWord" >> "password.txt"

# 入力が完了したら
echo "Thank you!"
