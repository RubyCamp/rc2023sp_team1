## クリア判定

require_relative "clear"
require_relative "gameover"

if result == "clear" ## クリア判定の書き方は適宜変更
    clear_action
else
    gameover_action
end