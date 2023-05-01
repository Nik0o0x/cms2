<?php
class Vote {
    /*
<<<<<<< HEAD
    Deklarujemy sobie w bazie tabelę, 4 kolumny - id, post_id, value, user_id gdzie:
    id - int autoincrement
    post_id - int, klucz zewnętrzny - post do którego należy głos
    score - int (-1,1)
    user_id - int, klucz obcy do user.id - kto głosował
=======
    Deklarujemy sobie w bazie tabelę, 3 kolumny - id, post_id, value, user_id gdzie:
    id - int autoincrement
    post_id - int, klucz zewnętrzny - post do którego należy głos
    value - int (-1,1)
    user_id - int, klucz obcy do user.id
>>>>>>> 2cf2201b444162419bfba04159eb639f0618fb91
    */

    public static function upVote(int $postId, int $userId) : bool {
        //kod do dodawania upvotów
        global $db;
        $query = $db->prepare("INSERT INTO vote VALUES (NULL, ?, 1, ?)");
        $query->bind_param('ii', $postId, $userId);
        if($query->execute())
            return true;
        return false;
    }
    public static function downVote(int $postId, int $userId) : bool {
        global $db;
        $query = $db->prepare("INSERT INTO vote VALUES (NULL, ?, -1, ?)");
        $query->bind_param('ii', $postId, $userId);
        if($query->execute())
            return true;
        return false;
    }
    public static function getScore(int $postId) : int {
        global $db;
        //zwróć sumę głosów dla danego posta
<<<<<<< HEAD
        $query = $db->prepare("SELECT SUM(score) FROM vote WHERE post_id = ?");
        $query->bind_param('i', $postId);
        if($query->execute()){
            $result = $query->get_result();
            if($result->num_rows > 0) {
                $row = $result->fetch_row();
                if($row[0] == NULL) {
                    //zwracane jeśli nie ma oddanych głosów
                    return 0;
                } else 
                    return $row[0];
            }
                
            else return 0;
=======
        $query = $db->prepare("SELECT SUM(value) FROM vote WHERE post_id = ?");
        $query->bind_param('i', $postId);
        if($query->execute()){
            $result = $query->get_result();
            $score = $result->fetch_row()[0];
            return $score;
>>>>>>> 2cf2201b444162419bfba04159eb639f0618fb91
        }
        return 0;
    }
    public static function getVote(int $postId, int $userId) : int {
<<<<<<< HEAD
        //funkcja zwraca (-1,0,1) w zależności od teo czy użytkownik oddał już głos na tego mema
        global $db;
        $query = $db->prepare("SELECT score FROM vote WHERE post_id = ? AND user_id = ?");
        $query->bind_param('ii', $postId, $userId);
        if($query->execute()) {
            $result = $query->get_result();
            if($result->num_rows > 0)
                return $result->fetch_row()[0];
            else return 0 ;
=======
        //funkcja zwraca (-1,0,1) w zależności od teo czy użytkownik oddał już głos.
        global $db;
        $query = $db->prepare("SELECT value FROM vote WHERE post_id = ? AND user_id = ?");
        $query->bind_param('ii', $postId, $userId);
        if($query->execute()) {
            $vote = $query->get_result()->fetch_row()[0];
            return $vote;
>>>>>>> 2cf2201b444162419bfba04159eb639f0618fb91
        }
        return 0;
    }
    
}
?>