swirl()
num_vect <- c(0.5,55,-10,6)
tf <- num_vect<1
num_vect >= 6
my_char <- c("My","name","is")
paste(my_char, collapse = " ")
c(my_char, "Victor")
my_name <- c(my_char, "Victor")
my_vector <- 1:20
dim(my_vector)
length(my_vector)
dim(my_vector) <- c(4, 5)
dim(my_vector)
attributes(my_vector)
my_vector
class(my_vector)
my_matrix <- my_vector
?matrix
my_matrix2 <- matrix(1:20,nrow=4,ncol=5)
identical(my_matrix,my_matrix2)
patients <- c("Bill", "Gina", "Kelly", "Sean")
cbind(patients,my_matrix)
my_data <- data.frame(patients, my_matrix)
class(my_data)
cnames<-c("patient", "age", "weight", "bp", "rating", "test")
colnames(cnames) <- my_data
colnames(cnames,my_data)
colnames(cnames)
colnames(my_data) <- cnames
