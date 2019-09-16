class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    loop do
      puts "自分の数字を入力してください"
      puts "0: グー"
      puts "1: チョキ"
      puts "2: パー"
      # この後の正規表現で条件分岐するために入力した文字もしくは数値を文字列に変換(アルファベットが0になってしまうのを回避)
      player_hand_str = gets.chomp.to_s
      # この後の条件分岐で文字列もしくは数字が一桁かどうか判別するために文字数を player_hand_length に代入
      player_hand_length = player_hand_str.length
      # この後の条件分岐と処理のため数値に変換して player_hand に代入
      player_hand = player_hand_str.to_i
      # 0,1,2いずれかの文字かつ0以上2以下で文字数が一桁のとき以外は再入力を求めるよう出力
      unless (/[0-2]{1}/).match?("#{player_hand_str}") && player_hand >= 0 && player_hand <= 2 && player_hand_length == 1
        puts "0〜2の数字を入力してください。"
      else
        return player_hand
        break
      end
    end
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    return rand(0..2)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる

    loop do
      # じゃんけんの勝ち負けを判断する計算式を変数calc_resultに代入
      calc_result = (player_hand - enemy_hand + 3) % 3
      # 相手の出した手を数字からグーチョキパーに変換して変数enemy_hand_exに代入
      case enemy_hand
      when 0 then enemy_hand_ex = "グー"
      when 1 then enemy_hand_ex = "チョキ"
      when 2 then enemy_hand_ex = "パー"
      end
      # じゃんけんの勝ち負けを判断する計算式から出力された数字から勝敗を決定してループ処理を抜ける
      case calc_result
      when 2
        puts "相手の手は#{enemy_hand_ex}です。あなたの勝ちです。"
        break
      when 1
        puts "相手の手は#{enemy_hand_ex}です。あなたの負けです。"
        break
      else
        # あいこの時はもう一度 enemy_hand にグー、チョキ、パーの値をランダムに代入する
        enemy_hand = rand(0..2)
      end
    end
  end
end

# ① player = Player.newの記述の意味↓
# Playerクラスからインスタンスを生成して変数playerに代入
# ② 大文字のPlayerと小文字のplayerの違い↓
# 大文字のPlayerはクラス、小文字のplayerはインスタンスが代入された変数
player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)
