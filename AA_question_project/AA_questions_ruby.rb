require 'singleton'
require 'sqlite3'
# require "questions.db"
class QuestionsDatabase < SQLite3::Database
    include Singleton
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Users
    attr_accessor :id, :fname, :lname 
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

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end 

    
end

class Questions 
 attr_accessor :id, :title, :body, :associated_author_id
    def self.find_by_id(id)
        id = QuestionsDatabase.instance.execute(<<-SQL, id )
        SELECT
            *
        FROM
            questions
        WHERE
            id = ?
        SQL
        return nil unless id.length > 0
        Questions.new(id.first)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @associated_author_id = options['associated_author_id']
    end 
end

class QuestionFollows
 attr_accessor :id, :question_id, :user_id 
    def self.find_by_id(id)
        id = QuestionsDatabase.instance.execute(<<-SQL, id )
        SELECT
            *
        FROM
            question_follows
        WHERE
            id = ?
        SQL
        return nil unless id.length > 0
        QuestionFollows.new(id.first)
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end 
end

class Replies
 attr_accessor :id, :question_id, :user_reply_id, :parent_reply_id  
    def self.find_by_id(id)
        id = QuestionsDatabase.instance.execute(<<-SQL, id )
        SELECT
            *
        FROM
            replies
        WHERE
            id = ?
        SQL
        return nil unless id.length > 0
        Replies.new(id.first)
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_reply_id = options['user_reply_id']
        @parent_reply_id = options['parent_reply_id']
    end 
end

class QuestionLikes
 attr_accessor :id, :liked_question_id, :liked_users_id  
    def self.find_by_id(id)
        id = QuestionsDatabase.instance.execute(<<-SQL, id )
        SELECT
            *
        FROM
            question_likes 
        WHERE
            id = ?
        SQL
        return nil unless id.length > 0
        QuestionLikes.new(id.first)
    end

    def initialize(options)
        @id = options['id']
        @liked_question_id = options['liked_question_id']
        @liked_users_id = options['liked_users_id']
    end 
end

