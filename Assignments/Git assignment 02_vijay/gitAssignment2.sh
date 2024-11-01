# I tried to prepare this assignment in terms of the script
# here all the necessary commands and also some commnads that were needed i also added them
# I wrote everything by my self, i am able to answer questions on any command. 

git checkout main
#1.create a git directory with feature1.txt and feature2.txt
echo "1.create a git directory with feature1.txt and feature2.txt"
direc="C:\Users\vijay\Documents\Certification\DEVOPS\Practical\DEVOPS\MDir"

if [ ! -d "$direc" ]; then
	echo "folder doesn't exsit"
	mkdir -p "$direc"
else
	echo "folder already exist"
fi	
cd MDir
touch feature1.txt 
touch  feature2.txt
cd ..
#2. create 3 branches 
echo "2. branch develop feature1 and feature2".

for i in 	"develop" "feature1" "feature2"
	do 
		 var=$(git branch --list "$i")
		 echo "var = $var"
		 
		if [ -z "$var" ]; then  	
			echo "$i does not exist"
			git branch "$i"
			git push --set-upstream origin "$i"
		
		else
			echo "i=$i branch exist"
			git push --set-upstream origin "$i"
		fi  
	done
git branch

#3. In develop branch create a touch file
echo "3.In develop branch create a touch file"
git checkout develop
touch  develop.txt
ls

#4. Git stash
echo "4. Git Stash"

git add Mdir/
git stash
git stash list

#5. Create new.txt file in feature1 branch, stage and commit this file 
echo "5. Create new.txt file in feature1 branch, stage and commit this file"
git checkout feature1 
cd MDir
touch new.txt
git stash
git add new.txt
git status 
git commit -m "adding new.txt in branch feature1"
git push
 		
#6. git checkout develop and unstash 	
echo "6. branch develop and git unstash"
git checkout develop
git stash pop 
git stash list
git status 
git add -all
git commit -m "Stashed changes"
git push

#Note :more Git stash commands
#git stash list
#git stash apply stash@{0}  -- dosent't deletes from the stash list.
#git stash pop  -- it deletes from the stash list.

#Note : delete branch
#git branch -d develop

