05. Construct Binary Tree from Preorder and Inorder Traversal
Medium

1580

41

Favorite

Share
Given preorder and inorder traversal of a tree, construct the binary tree.

Note:
You may assume that duplicates do not exist in the tree.

For example, given

preorder = [3,9,20,15,7]
inorder = [9,3,15,20,7]
Return the following binary tree:

    3
   / \
  9  20
    /  \
   15   7
   
   
   /**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    public TreeNode buildTree(int[] preorder, int[] inorder) {
        return helper(preorder, inorder, 0, preorder.length - 1, 0);
        
    }
    public TreeNode helper(int[] preorder, int[] inorder, int inStart, int inEnd, int preIndex){
        if(inStart >= inEnd){
            return null;
        }
        System.out.println(preIndex);
        TreeNode root = new TreeNode(preorder[preIndex]);
        int i;
        for(i = inStart; i <= inEnd; i++){
            if(inorder[i] == root.val){
                break;
            }
        }
        root.left = helper(preorder, inorder, inStart, i - 1, preIndex + 1);
        root.right = helper(preorder, inorder, inStart + i , inEnd, preIndex + (i - inStart) + 1);
        return root;
    }
}
