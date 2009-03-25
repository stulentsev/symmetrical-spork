class CreateUserTypes < ActiveRecord::Migration
  def self.up
    create_table :user_types do |t|
      t.string :name

      t.timestamps
    end

    UserType.create(:name => 'Coordenador')
    UserType.create(:name => 'Educador de Linguagem')
    UserType.create(:name => 'Educador Transversal')
    UserType.create(:name => 'Educando')
    UserType.create(:name => 'Gestor')
  end

  def self.down
    drop_table :user_types
  end
end
