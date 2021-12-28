require 'rspec'
require_relative '../PostsController'

describe PostsController do
  it '#index' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('first post', 'second post')
    subject.create
    subject.create
    expect { subject.index }.to output("0. first post\n1. second post\n").to_stdout
  end

  it '#show' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('first post', 'second post', 1)
    subject.create
    subject.create
    expect { subject.show }.to output("Input post id: 1. second post\n").to_stdout
  end

  it '#create' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('first post', 0)
    subject.create
    expect { subject.show }.to output("Input post id: 0. first post\n").to_stdout
  end

  it '#update' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('first post', 0, 'updated')
    subject.create
    subject.update
    expect { subject.index }.to output("0. updated\n").to_stdout
  end

  it '#destroy' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('first post', 'second post', 1)
    subject.create
    subject.create
    subject.destroy
    expect { subject.index }.to output("0. first post\n").to_stdout
  end
end
