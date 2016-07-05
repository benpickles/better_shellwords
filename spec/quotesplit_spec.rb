require 'quotesplit'

RSpec.describe Quotesplit do
  describe '.split' do
    it 'works' do
      expect(Quotesplit.split('lorem ipsum')).to eql(['lorem', 'ipsum'])
    end
  end

  describe '#split' do
    subject { Quotesplit.new(string).split }

    context 'empty' do
      let(:string) { '' }
      it { should eql([]) }
    end

    context 'simple' do
      let(:string) { 'simple' }
      it { should eql(['simple']) }
    end

    context 'multi-word' do
      let(:string) { 'multi-word simple' }
      it { should eql(['multi-word', 'simple']) }
    end

    context 'with non-word characters' do
      let(:string) { ',hello,there...how_are;you?' }
      it { should eql([',hello,there...how_are;you?']) }
    end

    context 'single "' do
      let(:string) { '"' }
      it { should eql(['"']) }
    end

    context "single '" do
      let(:string) { "'" }
      it { should eql(["'"]) }
    end

    context '"quoted"' do
      let(:string) { ' "quoted  term" ' }
      it { should eql(['quoted  term']) }
    end

    context '"quoted" and unquoted' do
      let(:string) { 'a "quoted  term" and more' }
      it { should eql(['a', 'quoted  term', 'and', 'more']) }
    end

    context '"unbalanced quote' do
      let(:string) { 'oh "dear what can the matter be' }
      it { should eql(['oh', '"dear', 'what', 'can', 'the', 'matter', 'be']) }
    end

    context 'another unbalanced" quote' do
      let(:string) { 'another unbalanced" quote' }
      it { should eql(['another', 'unbalanced"', 'quote']) }
    end

    context "'quoted'" do
      let(:string) { " 'quoted  term' " }
      it { should eql(['quoted  term']) }
    end

    context "'quoted' and unquoted" do
      let(:string) { "a 'quoted  term' and more" }
      it { should eql(['a', 'quoted  term', 'and', 'more']) }
    end

    context "'unbalanced quote" do
      let(:string) { "oh 'dear what can the matter be" }
      it { should eql(['oh', "'dear", 'what', 'can', 'the', 'matter', 'be']) }
    end

    context "another unbalanced' quote" do
      let(:string) { "another unbalanced' quote" }
      it { should eql(['another', "unbalanced'", 'quote']) }
    end

    context 'mixed quotes' do
      let(:string) { %( '"quoted  "term"' and "more ''like" this ) }
      it { should eql(['"quoted  "term"', 'and', "more ''like", 'this']) }
    end
  end
end
