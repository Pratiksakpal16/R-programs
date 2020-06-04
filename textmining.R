install.packages("XML")
install.packages("rvest")
install.packages("magrittr")
library("XML")
library("rvest")
library("magrittr")
aurl="https://www.amazon.in/Apple-iPhone-View-XR-64GB-Black/product-reviews/B07JWV47JW/ref=sr_1_1?showViewpoints"
amazon_reviews=NULL

for(i in 1:20){
  murl=read_html(as.character(paste(aurl,i,sep="=")))
  rev=murl%>%
    html_nodes(".review-text")%>%
    html_text()
  amazon_reviews=c(amazon_reviews,rev)
}
amazon_reviews
write.table(amazon_reviews,"iphone.txt")
getwd()
install.packages("tm")
library(tm)
install.packages("wordcloud2")
library(wordcloud2)
text=readLines(file.choose(),encoding = "UTF-8")
corpus=Corpus(VectorSource(text))
inspect(corpus[1:5])
corpus=tm_map(corpus,tolower)
corpus=tm_map(corpus,removePunctuation)
corpus=tm_map(corpus,removeNumbers)
cleanset=tm_map(corpus,removeWords,stopwords('english'))
removeURL=function(x) gsub('http[[:alnum:]]*',"",x)
cleanset=tm_map(cleanset,content_transformer(removeURL))
cleanset=tm_map(cleanset,stripWhitespace)
inspect(cleanset[1:2])
tdm=TermDocumentMatrix(cleanset)
tdm=as.matrix(tdm)
tdm[1:10, 1:20]
w=sort(rowSums(tdm), decreasing = TRUE)
w
set.seed(222)
install.packages("wordcloud2")
library(wordcloud2)
w=data.frame(names(w), w)
colnames(w)=c('word', 'freq')
wordcloud2(w,
           size = 0.7,
           shape = ,
           rotateRatio = 0.5,
           minSize = 1)

