require 'rspec'
require_relative '../CommentsController'

describe CommentsController do
  it '#index' do
    allow_any_instance_of(CommentsController).to receive(:gets).and_return('first comment', 'second comment')
    subject.create
    subject.create
    expect { subject.index }.to output("0. first comment\n1. second comment\n").to_stdout
  end

  it '#show' do
    allow_any_instance_of(CommentsController).to receive(:gets).and_return('first comment', 'second comment', 1)
    subject.create
    subject.create
    expect { subject.show }.to output("Input comment id: 1. second comment\n").to_stdout
  end

  it '#create' do
    allow_any_instance_of(CommentsController).to receive(:gets).and_return('first comment', 0)
    subject.create
    expect { subject.show }.to output("Input comment id: 0. first comment\n").to_stdout
  end

  it '#update' do
    allow_any_instance_of(CommentsController).to receive(:gets).and_return('first comment', 0, 'updated')
    subject.create
    subject.update
    expect { subject.index }.to output("0. updated\n").to_stdout
  end

  it '#destroy' do
    allow_any_instance_of(CommentsController).to receive(:gets).and_return('first comment', 'second comment', 1)
    subject.create
    subject.create
    subject.destroy
    expect { subject.index }.to output("0. first comment\n").to_stdout
  end
end
