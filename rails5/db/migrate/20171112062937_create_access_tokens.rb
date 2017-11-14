class CreateAccessTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :access_tokens do |t|
      t.string :token, null: false
      t.string :user_id, null: false
      t.timestamps
    end

    add_index :access_tokens, :token,   unique: true,  name: 'uk_access_tokens_token'
    add_index :access_tokens, :user_id, unique: false, name: 'index_access_tokens_user_id'
  end
end
