require "singleton"
require "sqlite3"
require "questions.db"
class QuestionsDatabase < SQLite3::Database
    include Singleton
    def initialize
        super(questions.db)
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Users
    def self.find_by_id(id)
        id = QuestionsDatabase.instance.execute(<<-SQL, id )
        SELECT
            *
        FROM
            users
        WHERE
            id = ?
        SQL
        return nil unless id.length > 0
        Users.new(id.first)
    end

    
end

class Questions 

end

class QuestionFollows

end

class Replies

end

class QuestionLikes

end

